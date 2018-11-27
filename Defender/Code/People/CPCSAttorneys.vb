Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Public Class CPCSAttorneys
    Public Shared Function getAttorneyDetails(ByVal AttorneyGUID As Guid) As DataTable
        Dim strAttorneyCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("AttorneyInfoTable")
        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyNameReverse", Type.[GetType]("System.String"))
        dt.Columns.Add("BBO", Type.[GetType]("System.String"))
        dt.Columns.Add("Email", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("DateJoined", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("DateLeft", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("UnitID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("OfficeName", Type.[GetType]("System.String"))
        dt.Columns.Add("UnitTypeName", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Attorney.AttorneyID, Attorney.AttorneyGUID, Attorney.UnitID, Attorney.BBO, Attorney.Email, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName,  Attorney.DateJoined, Attorney.DateLeft,  Office.OfficeName, UnitType.UnitTypeName   FROM Attorney  LEFT OUTER JOIN Unit ON Attorney.UnitID = Unit.UnitID  INNER JOIN UnitType ON Unit.UnitTypeID = UnitType.UnitTypeID INNER JOIN Office ON Unit.OfficeID = Office.OfficeID")
        strBuilder.Append(" WHERE")
        strBuilder.Append(" (")
        strBuilder.Append("Attorney.AttorneyGUID = @AttorneyGUID")
        strBuilder.Append(")")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAttorneyCasesConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)
        If strAttorneyCasesConn.State = ConnectionState.Closed Then strAttorneyCasesConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("AttorneyID") = rdr("AttorneyID")
                dr("AttorneyGUID") = rdr("AttorneyGUID")
                dr("AttorneyName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                dr("AttorneyNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                dr("Email") = rdr("Email")
                dr("BBO") = rdr("BBO")
                dr("DateJoined") = rdr("DateJoined")
                dr("DateLeft") = rdr("DateLeft")
                dr("UnitID") = rdr("UnitID")
                dr("OfficeName") = rdr("OfficeName")
                dr("UnitTypeName") = rdr("UnitTypeName")
                dt.Rows.Add(dr)
            Loop
        End If
        If strAttorneyCasesConn.State = ConnectionState.Open Then strAttorneyCasesConn.Close()
        Return dt
    End Function
    Public Shared Function getAttorneyID(ByVal AttorneyGUID As Guid) As Int32
        Dim strAttorneyID As Int32 = 0
        Dim strAttorneyIDConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Attorney.AttorneyID FROM Attorney")
        strBuilder.Append(" WHERE")
        strBuilder.Append(" (")
        strBuilder.Append("Attorney.AttorneyGUID = @AttorneyGUID")
        strBuilder.Append(")")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAttorneyIDConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)
        If strAttorneyIDConn.State = ConnectionState.Closed Then strAttorneyIDConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                strAttorneyID = rdr("AttorneyID")
            Loop
        End If
        If strAttorneyIDConn.State = ConnectionState.Open Then strAttorneyIDConn.Close()
        Return strAttorneyID
    End Function
    Public Shared Function getAttorneyName(ByVal AttorneyGUID As Guid) As String
        Dim strAttorneyName As String = String.Empty
        Dim strAttorneyNameConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Attorney.AttorneyID, Attorney.AttorneyGUID, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName FROM Attorney")
        strBuilder.Append(" WHERE")
        strBuilder.Append(" (")
        strBuilder.Append("Attorney.AttorneyGUID = @AttorneyGUID")
        strBuilder.Append(")")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAttorneyNameConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@AttorneyGUID", AttorneyGUID)
        If strAttorneyNameConn.State = ConnectionState.Closed Then strAttorneyNameConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                'strAttorneyName = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                strAttorneyName = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
            Loop
        End If
        If strAttorneyNameConn.State = ConnectionState.Open Then strAttorneyNameConn.Close()
        Return strAttorneyName
    End Function
    Public Shared Function getAllAttorneys(Optional AttorneyID As Int32 = 0, Optional ByVal AttorneyName As String = "", Optional ByVal UnitID As Int32 = 0, Optional ByVal UnitTypeName As String = "", Optional ByVal OfficeName As String = "") As DataTable
        Dim HasParameters As Boolean = False
        If Not String.IsNullOrWhiteSpace((UnitTypeName.ToString & UnitID.ToString & OfficeName.ToString.Trim & AttorneyID.ToString & AttorneyName.ToString).Replace("0", "").Trim) Then
            HasParameters = True
        End If
        Dim strAllAttorneysConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("AllAttorneysTable")
        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyNameReverse", Type.[GetType]("System.String"))
        dt.Columns.Add("BBO", Type.[GetType]("System.String"))
        dt.Columns.Add("Email", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("DateJoined", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("DateLeft", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("UnitID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("OfficeName", Type.[GetType]("System.String"))
        dt.Columns.Add("UnitTypeName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyCaseCount", Type.[GetType]("System.Int32"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Attorney.AttorneyID, Attorney.AttorneyGUID, Attorney.UnitID, Attorney.BBO, Attorney.Email, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName,  Attorney.DateJoined, Attorney.DateLeft,  Office.OfficeName, UnitType.UnitTypeName,  (SELECT COUNT(DISTINCT CaseNumber) AS AC FROM CaseAttorney WHERE (AttorneyID = Attorney.AttorneyID)) AS AttorneyCaseCount FROM Attorney  LEFT OUTER JOIN Unit ON Attorney.UnitID = Unit.UnitID  INNER JOIN UnitType ON Unit.UnitTypeID = UnitType.UnitTypeID INNER JOIN Office ON Unit.OfficeID = Office.OfficeID")
        If HasParameters Then
            strBuilder.Append(" WHERE")
            strBuilder.Append(" (")
            strBuilder.Append("Attorney.AttorneyID IS NOT NULL")
            If AttorneyID <> 0 Then strBuilder.Append(" AND Attorney.AttorneyID = @AttorneyID")
            If AttorneyID = 0 And AttorneyName <> "" Then strBuilder.Append(" AND (Attorney.FirstName +' '+ Attorney.LastName LIKE @AttorneyName OR Attorney.LastName +' '+ Attorney.FirstName LIKE @AttorneyName)")
            If UnitID <> 0 Then strBuilder.Append(" AND Attorney.UnitID = @UnitID")
            If OfficeName <> "" Then strBuilder.Append(" AND Office.OfficeName = @OfficeName")
            If UnitTypeName <> "" Then strBuilder.Append(" AND UnitType.UnitTypeName = @UnitTypeName")
            strBuilder.Append(")")
        End If
        strBuilder.Append(" ORDER BY AttorneyCaseCount DESC")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllAttorneysConn)
        If HasParameters Then
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@AttorneyID", AttorneyID)
            cmd.Parameters.AddWithValue("@AttorneyName", "%" & AttorneyName.Trim.Replace(" ", "%") & "%")
            cmd.Parameters.AddWithValue("@UnitID", UnitID)
            cmd.Parameters.AddWithValue("@UnitTypeName", UnitTypeName)
            cmd.Parameters.AddWithValue("@OfficeName", OfficeName)
        End If
        If strAllAttorneysConn.State = ConnectionState.Closed Then strAllAttorneysConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("AttorneyID") = rdr("AttorneyID")
                dr("AttorneyGUID") = rdr("AttorneyGUID")
                dr("AttorneyName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                dr("AttorneyNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                dr("Email") = rdr("Email").ToString.ToLower
                dr("BBO") = rdr("BBO")
                dr("DateJoined") = rdr("DateJoined")
                dr("DateLeft") = rdr("DateLeft")
                dr("UnitID") = rdr("UnitID")
                dr("OfficeName") = rdr("OfficeName")
                dr("UnitTypeName") = rdr("UnitTypeName")
                dr("AttorneyCaseCount") = rdr("AttorneyCaseCount")
                dt.Rows.Add(dr)
            Loop
        End If
        If strAllAttorneysConn.State = ConnectionState.Open Then strAllAttorneysConn.Close()
        Return dt
    End Function
    Public Shared Function getAllAttorneySearch() As DataTable
        Dim strAllAttorneysSearchConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("AllAttorneysSearchTable")
        dt.Columns.Add("AttorneyID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("AttorneyGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))
        dt.Columns.Add("AttorneyNameReverse", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Attorney.AttorneyID, Attorney.AttorneyGUID, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName FROM Attorney")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllAttorneysSearchConn)
        cmd.Parameters.Clear()
        If strAllAttorneysSearchConn.State = ConnectionState.Closed Then strAllAttorneysSearchConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("AttorneyID") = rdr("AttorneyID")
                dr("AttorneyGUID") = rdr("AttorneyGUID")
                dr("AttorneyName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                dr("AttorneyNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
                dt.Rows.Add(dr)
            Loop
        End If
        If strAllAttorneysSearchConn.State = ConnectionState.Open Then strAllAttorneysSearchConn.Close()
        Return dt
    End Function
    Public Shared Function getAllAttorneyNames() As DataSet
        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Attorney.FirstName +' '+ Attorney.LastName) AS AttorneyNameReverse FROM Attorney;")
    End Function
End Class