Imports System.Data.SqlClient

Public Class ManagementCaseDetails
    Inherits System.Web.UI.Page



    Dim checkCaseIsValid As Boolean = False
    Dim checkHasValidGUID As Boolean = False

    Private Sub Apps_CaseManagement_CaseDetails_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Not String.IsNullOrEmpty(Request.QueryString("caseguid")) AndAlso Not IsNothing(Request.QueryString("caseguid")) Then

            phCaseIsValid.Visible = True
            phNoCaseFound.Visible = False
            checkHasValidGUID = True

        Else
            phCaseIsValid.Visible = False
            phNoCaseFound.Visible = True
            checkHasValidGUID = False

        End If


    End Sub

    Private Sub Apps_CaseManagement_CaseDetails_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender


        If checkHasValidGUID Then

            Dim strConn = DB.GetDataConnection()

            Dim commandStr As String = "SELECT DISTINCT [Case].CaseID, [Case].CaseGUID, [Case].CaseNumber, [Case].ClientID, Client.ClientGUID FROM [Case] LEFT OUTER JOIN Client ON [Case].ClientID=Client.ClientID WHERE [Case].CaseGUID=@CaseGUID;"


            Dim command As SqlClient.SqlCommand = New SqlCommand(commandStr, strConn)

            If strConn.State = ConnectionState.Closed Then strConn.Open()

            command.Parameters.Clear()
            command.Parameters.AddWithValue("@CaseGUID", Request.QueryString("caseguid"))

            Dim reader As SqlDataReader = command.ExecuteReader()

            If reader.HasRows Then

                checkCaseIsValid = True

                Do While reader.Read()

                    hdnCaseID.Value = reader("CaseID")
                    hdnCaseGUID.Value = Request.QueryString("caseguid")
                    ltrlCaseNumber.Text = reader("CaseNumber")

                    phCaseIsValid.Visible = True
                    phNoCaseFound.Visible = False


                Loop


            Else

                phCaseIsValid.Visible = False
                phNoCaseFound.Visible = True

            End If



            If strConn.State = ConnectionState.Open Then strConn.Close()

        End If


    End Sub



End Class
