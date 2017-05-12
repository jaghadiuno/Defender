Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class PersonCases



    Public Shared Function SearchResults(ByVal personGUID As Guid, ByVal personType As String) As DataTable



        Dim strPersonCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("PersonCasesTable")


        Dim PersonCasesID As DataColumn = New DataColumn
        PersonCasesID.DataType = System.Type.GetType("System.Int32")
        PersonCasesID.AllowDBNull = False
        PersonCasesID.Caption = "PersonCasesID"
        PersonCasesID.ColumnName = "PersonCasesID"

        PersonCasesID.AutoIncrement = True
        PersonCasesID.AutoIncrementSeed = 1
        PersonCasesID.AutoIncrementStep = 1


        dt.Columns.Add(PersonCasesID)


        dt.Columns.Add("ParticipantGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantName", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantFirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantMiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantLastName", Type.[GetType]("System.String"))

        dt.Columns.Add("ParticipantRole", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantPhone", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantDOB", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("ParticipantAge", Type.[GetType]("System.Int32"))

        dt.Columns.Add("ParticipantAddress", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantCity", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantState", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantZipCode", Type.[GetType]("System.String"))

        dt.Columns.Add("CaseID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CaseGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("CaseNumber", Type.[GetType]("System.String"))

        dt.Columns.Add("CaseDateOpened", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("CaseDateClosed", Type.[GetType]("System.DateTime"))

        dt.Columns.Add("LeadCharge", Type.[GetType]("System.String"))
        dt.Columns.Add("Disposition", Type.[GetType]("System.String"))

        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyFirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyLastName", Type.[GetType]("System.String"))

        dt.Columns.Add("ClientID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ClientGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientName", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientFirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientLastName", Type.[GetType]("System.String"))


        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT [ParticipantRole], [ParticipantGUID], [ParticipantFirstName], [ParticipantMiddleName], [ParticipantLastName], [ParticipantAddress], [ParticipantCity], [ParticipantState], [ParticipantZipCode], [ParticipantPhone], [ParticipantDOB], [CaseID], [CaseGUID], [CaseNumber], [CaseOpened], [CaseClosed], IsNull([CaseLeadChargeOffense], '~Charge information not available~') AS CaseLeadChargeOffense, ISNULL([CaseLeadChargeDisposition], '~Disposition information not available~') AS CaseLeadChargeDisposition, [AttorneyID], [AttorneyGUID], [AttorneyFirstName], [AttorneyLastName], [ClientID], [ClientGUID], [ClientFirstName], [ClientLastName] FROM df_VW_Conflict_Check")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")


        If personType = "Client" Then
            strBuilder.Append("(ClientGUID = @PersonGUID)")

        ElseIf personType = "Participant" Then
            strBuilder.Append("(ParticipantGUID = @PersonGUID)")

        ElseIf personType = "Attorney" Then
            strBuilder.Append("(AttorneyGUID = @PersonGUID)")
        End If


        strBuilder.Append(")")






        strBuilder.Append(" ORDER BY CaseClosed DESC")



        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strPersonCasesConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@PersonGUID", personGUID)
        cmd.Parameters.AddWithValue("@PersonType", personType)



        If strPersonCasesConn.State = ConnectionState.Closed Then strPersonCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ParticipantGUID") = rdr("ParticipantGUID")

                dr("ParticipantName") = rdr("ParticipantLastName") & ", " & rdr("ParticipantFirstName") & " " & rdr("ParticipantMiddleName")

                dr("ParticipantFirstName") = rdr("ParticipantFirstName")
                dr("ParticipantMiddleName") = rdr("ParticipantMiddleName")
                dr("ParticipantLastName") = rdr("ParticipantLastName")

                dr("ParticipantRole") = rdr("ParticipantRole")
                dr("ParticipantPhone") = rdr("ParticipantPhone")
                dr("ParticipantDOB") = rdr("ParticipantDOB")

                If IsDate(rdr("ParticipantDOB")) Then dr("ParticipantAge") = DateDiff(DateInterval.Year, CDate(rdr("ParticipantDOB")), Now)


                dr("ParticipantAddress") = rdr("ParticipantAddress")
                dr("ParticipantCity") = rdr("ParticipantCity")
                dr("ParticipantState") = rdr("ParticipantState")
                dr("ParticipantZipCode") = rdr("ParticipantZipCode")


                dr("CaseID") = rdr("CaseID")
                dr("CaseGUID") = rdr("CaseGUID")
                dr("CaseNumber") = rdr("CaseNumber")

                dr("CaseDateOpened") = rdr("CaseOpened")
                dr("CaseDateClosed") = rdr("CaseClosed")

                dr("LeadCharge") = rdr("CaseLeadChargeOffense")
                dr("Disposition") = rdr("CaseLeadChargeDisposition")


                dr("AttorneyID") = rdr("AttorneyID")
                dr("AttorneyGUID") = rdr("AttorneyGUID")
                dr("AttorneyName") = rdr("AttorneyLastName") & ", " & rdr("AttorneyFirstName")

                dr("AttorneyFirstName") = rdr("AttorneyFirstName")
                dr("AttorneyLastName") = rdr("AttorneyLastName")


                dr("ClientID") = rdr("ClientID")
                dr("ClientGUID") = rdr("ClientGUID")
                dr("ClientName") = rdr("ClientLastName") & ", " & rdr("ClientFirstName")

                dr("ClientFirstName") = rdr("ClientFirstName")
                dr("ClientLastName") = rdr("ClientLastName")


                dt.Rows.Add(dr)

            Loop

        End If


        If strPersonCasesConn.State = ConnectionState.Open Then strPersonCasesConn.Close()


        Return dt

    End Function



End Class



