using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RepertoireTelephonique
{
    public partial class frmContacts : Form
    {
        string oConnect = @"Data Source=(local);Initial Catalog=RépertoireTéléphoniqueDB;Persist Security Info=True;User ID=sa;Password=localhost;";
        int REP_ID = 0;

        public frmContacts()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if(txtPrenom.Text.Trim() != "" && txtNom.Text.Trim() != "" && txtContact.Text.Trim() != "")
            {
                Regex reg = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match match = reg.Match(txtEmail.Text.Trim());
                if(match.Success)
                {
                    using (SqlConnection oCon = new SqlConnection(oConnect))
                    {
                        oCon.Open();
                        SqlCommand oCmd = new SqlCommand("ContactAddOrEdit", oCon);
                        oCmd.CommandType = CommandType.StoredProcedure;
                        oCmd.Parameters.AddWithValue("@REP_ID", REP_ID);
                        oCmd.Parameters.AddWithValue("@REP_Prenom", txtPrenom.Text.Trim());
                        oCmd.Parameters.AddWithValue("@REP_Nom", txtNom.Text.Trim());
                        oCmd.Parameters.AddWithValue("@REP_Contact", txtContact.Text.Trim());
                        oCmd.Parameters.AddWithValue("@REP_Email", txtEmail.Text.Trim());
                        oCmd.Parameters.AddWithValue("@REP_Adresse", txtAdresse.Text.Trim());
                        oCmd.ExecuteNonQuery();
                        MessageBox.Show("Enregistrement avec succès!!");
                        Clear();
                        GridFill();
                    }
                }
                else
                {
                    MessageBox.Show("Email invalide !!");
                }
            }
            else
            {
                MessageBox.Show("Remplissez les champs obligatoires s'il vous plaît !!!");
            }
        }

        void Clear()
        {
            txtPrenom.Text = txtNom.Text = txtContact.Text = txtEmail.Text = txtAdresse.Text = txtSearch.Text = "";
            REP_ID = 0;
            btnSave.Text = "Enregistrer";
            btnDelete.Enabled = false;
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void GridFill()
        {
            using(SqlConnection oCon = new SqlConnection(oConnect))
            {
                oCon.Open();
                SqlDataAdapter oData = new SqlDataAdapter("SelectAllContacts", oCon);
                oData.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                oData.Fill(dtbl);
                dataGridPhoneBook.DataSource = dtbl;
            }
        }

        private void frmContacts_Load(object sender, EventArgs e)
        {
            GridFill();
            btnDelete.Enabled = false;
        }

        private void dataGridPhoneBook_DoubleClick(object sender, EventArgs e)
        {
            if(dataGridPhoneBook.CurrentRow.Index != -1)
            {
                txtPrenom.Text = dataGridPhoneBook.CurrentRow.Cells[1].Value.ToString();
                txtNom.Text = dataGridPhoneBook.CurrentRow.Cells[2].Value.ToString();
                txtContact.Text = dataGridPhoneBook.CurrentRow.Cells[3].Value.ToString();
                txtEmail.Text = dataGridPhoneBook.CurrentRow.Cells[4].Value.ToString();
                txtAdresse.Text = dataGridPhoneBook.CurrentRow.Cells[5].Value.ToString();
                REP_ID = Convert.ToInt32(dataGridPhoneBook.CurrentRow.Cells[0].Value.ToString());

                btnSave.Text = "Mettre à jour";
                btnDelete.Enabled = true;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            using(SqlConnection oCon = new SqlConnection(oConnect))
            {
                oCon.Open();
                SqlCommand sqlCmd = new SqlCommand("ContactsDeleteByID", oCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@REP_ID", REP_ID);
                sqlCmd.ExecuteNonQuery();
                MessageBox.Show("Un élement supprimé avec succés !!");
                Clear();
                GridFill();
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            using(SqlConnection sqlCon = new SqlConnection(oConnect))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("RechercheContactsParValeur", sqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("@SearchValue", txtSearch.Text.Trim());
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                dataGridPhoneBook.DataSource = dtbl;
            }
        }
    }
}