Imports System.Data.SqlClient
Imports Microsoft.VisualBasic




Public Class Metrics




    'Public Shared Function getCaseDetails(
    '                ByVal CaseNumber As String
    ') As DataTable

    '    '"SELECT * From df_VW_Conflict_Check WHERE (CaseNumber = @CaseNumber AND ParticipantRole = 'Client')"


    '    Dim strAttorneyCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


    '    Dim dt As New DataTable("CaseDetails")


    '    dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
    '    dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))
    '    dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))
    '    dt.Columns.Add("AttorneyNameReverse", Type.[GetType]("System.String"))


    '    dt.Columns.Add("BBO", Type.[GetType]("System.String"))
    '    dt.Columns.Add("Email", Type.[GetType]("System.String"))

    '    dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
    '    dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
    '    dt.Columns.Add("LastName", Type.[GetType]("System.String"))


    '    dt.Columns.Add("DateJoined", Type.[GetType]("System.DateTime"))
    '    dt.Columns.Add("DateLeft", Type.[GetType]("System.DateTime"))


    '    dt.Columns.Add("UnitID", Type.[GetType]("System.Int32"))
    '    dt.Columns.Add("OfficeName", Type.[GetType]("System.String"))
    '    dt.Columns.Add("UnitTypeName", Type.[GetType]("System.String"))


    '    Dim dr As DataRow



    '    Dim strBuilder As New StringBuilder


    '    strBuilder.Append("SELECT Attorney.AttorneyID, Attorney.AttorneyGUID, Attorney.UnitID, Attorney.BBO, Attorney.Email, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName,  Attorney.DateJoined, Attorney.DateLeft,  Office.OfficeName, UnitType.UnitTypeName   FROM         Attorney  LEFT OUTER JOIN Unit ON Attorney.UnitID = Unit.UnitID  INNER JOIN UnitType ON Unit.UnitTypeID = UnitType.UnitTypeID INNER JOIN Office ON Unit.OfficeID = Office.OfficeID")


    '    strBuilder.Append(" WHERE")


    '    strBuilder.Append(" (")

    '    strBuilder.Append("Attorney.AttorneyGUID = @AttorneyGUID")

    '    strBuilder.Append(")")




    '    Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAttorneyCasesConn)

    '    'Command parameter goes in here
    '    cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)

    '    If strAttorneyCasesConn.State = ConnectionState.Closed Then strAttorneyCasesConn.Open()

    '    Dim rdr As SqlDataReader = cmd.ExecuteReader()

    '    If rdr.HasRows Then

    '        Do While rdr.Read()


    '            dr = dt.NewRow()

    '            dr("AttorneyID") = rdr("AttorneyID")
    '            dr("AttorneyGUID") = rdr("AttorneyGUID")

    '            dr("AttorneyName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

    '            dr("AttorneyNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)


    '            dr("FirstName") = rdr("FirstName").ToString.Trim
    '            dr("MiddleName") = rdr("MiddleName")
    '            dr("LastName") = rdr("LastName").ToString.Trim




    '            dr("Email") = rdr("Email")
    '            dr("BBO") = rdr("BBO")
    '            dr("DateJoined") = rdr("DateJoined")
    '            dr("DateLeft") = rdr("DateLeft")

    '            dr("UnitID") = rdr("UnitID")
    '            dr("OfficeName") = rdr("OfficeName")
    '            dr("UnitTypeName") = rdr("UnitTypeName")





    '            dt.Rows.Add(dr)

    '        Loop

    '    End If


    '    If strAttorneyCasesConn.State = ConnectionState.Open Then strAttorneyCasesConn.Close()




    'End Function




End Class
