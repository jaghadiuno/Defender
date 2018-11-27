Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Public Class CPCSParticipants
    Public Shared Function getParticipantDetails(ByVal ParticipantGUID As Guid) As DataTable
        Dim strParticipantCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("ParticipantInfoTable")
        dt.Columns.Add("ParticipantID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ParticipantGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantName", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantNameReverse", Type.[GetType]("System.String"))
        dt.Columns.Add("SSN", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("Age", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DOB", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("PcfNumber", Type.[GetType]("System.String"))
        dt.Columns.Add("Address", Type.[GetType]("System.String"))
        dt.Columns.Add("Address2", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))
        dt.Columns.Add("State", Type.[GetType]("System.String"))
        dt.Columns.Add("ZipCode", Type.[GetType]("System.String"))
        dt.Columns.Add("Phone", Type.[GetType]("System.String"))
        dt.Columns.Add("Comments", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Participant.ParticipantID, Participant.ParticipantGUID, Participant.SSN, Participant.FirstName, Participant.MiddleName, Participant.LastName, Participant.DOB, Participant.Address, Participant.Address2, Participant.City, Participant.State, Participant.ZipCode, Participant.Phone, Participant.Comments FROM Participant")
        strBuilder.Append(" WHERE")
        strBuilder.Append(" (")
        strBuilder.Append("Participant.ParticipantGUID = @ParticipantGUID")
        strBuilder.Append(")")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strParticipantCasesConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ParticipantGUID", ParticipantGUID)
        If strParticipantCasesConn.State = ConnectionState.Closed Then strParticipantCasesConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("ParticipantID") = rdr("ParticipantID")
                dr("ParticipantGUID") = rdr("ParticipantGUID")
                dr("ParticipantName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                dr("ParticipantNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
                dr("SSN") = "XXX-XX-" & IIf(IsDBNull(rdr("SSN")), "0000", Right(rdr("SSN").ToString, 4))
                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                If IsDate(rdr("DOB")) Then
                    dr("Age") = DateDiff(DateInterval.Year, CDate(rdr("DOB").ToString), Now)
                    dr("DOB") = IIf(IsDate(rdr("DOB")), CDate(rdr("DOB")).ToShortDateString, DBNull.Value)
                End If
                dr("Address") = rdr("Address").ToString.Trim
                dr("Address2") = rdr("Address2").ToString.Trim
                dr("City") = rdr("City").ToString.Trim
                dr("State") = rdr("State").ToString.Trim
                dr("ZipCode") = rdr("ZipCode")
                dr("Phone") = rdr("Phone")
                dr("Comments") = rdr("Comments")
                dt.Rows.Add(dr)
            Loop
        End If
        If strParticipantCasesConn.State = ConnectionState.Open Then strParticipantCasesConn.Close()
        Return dt
    End Function
    Public Shared Function getParticipantName(ByVal ParticipantGUID As Guid) As String
        Dim strParticipantName As String = String.Empty
        Dim strParticipantNameConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT Participant.ParticipantID, Participant.ParticipantGUID, Participant.FirstName, Participant.MiddleName, Participant.LastName FROM Participant")
        strBuilder.Append(" WHERE")
        strBuilder.Append(" (")
        strBuilder.Append("Participant.ParticipantGUID = @ParticipantGUID")
        strBuilder.Append(")")
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strParticipantNameConn)
        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ParticipantGUID", ParticipantGUID)
        If strParticipantNameConn.State = ConnectionState.Closed Then strParticipantNameConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                strParticipantName = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
            Loop
        End If
        If strParticipantNameConn.State = ConnectionState.Open Then strParticipantNameConn.Close()
        Return strParticipantName
    End Function
    Public Shared Function getAllParticipants(Optional ByVal FirstName As String = "", Optional ByVal LastName As String = "", Optional ByVal ParticipantName As String = "") As DataTable
        Dim HasParameters As Boolean = False
        If Not String.IsNullOrWhiteSpace(FirstName.ToString & LastName.ToString.Trim & ParticipantName.ToString.Trim) Then
            HasParameters = True
        End If
        Dim strParticipantCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        Dim dt As New DataTable("ParticipantInfoTable")
        dt.Columns.Add("ParticipantID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ParticipantGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantName", Type.[GetType]("System.String"))
        dt.Columns.Add("ParticipantNameReverse", Type.[GetType]("System.String"))
        dt.Columns.Add("SSN", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("Age", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DOB", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("PcfNumber", Type.[GetType]("System.String"))
        dt.Columns.Add("Address", Type.[GetType]("System.String"))
        dt.Columns.Add("Address2", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))
        dt.Columns.Add("State", Type.[GetType]("System.String"))
        dt.Columns.Add("ZipCode", Type.[GetType]("System.String"))
        dt.Columns.Add("Phone", Type.[GetType]("System.String"))
        dt.Columns.Add("Comments", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim strBuilder As New StringBuilder
        strBuilder.Append("SELECT TOP 1000 Participant.ParticipantID, Participant.ParticipantGUID, Participant.SSN, Participant.FirstName, Participant.MiddleName, Participant.LastName, Participant.DOB, Participant.Address, Participant.Address2, Participant.City, Participant.State, Participant.ZipCode, Participant.Phone, Participant.Comments FROM Participant")
        If HasParameters Then
            strBuilder.Append(" WHERE")
            strBuilder.Append(" (")
            strBuilder.Append("Participant.ParticipantID IS NOT NULL")
            If FirstName <> "" Then strBuilder.Append(" AND Participant.FirstName = @FirstName")
            If LastName <> "" Then strBuilder.Append(" AND Participant.LastName = @LastName")
            If ParticipantName <> "" Then strBuilder.Append(" AND (Participant.FirstName +' '+ Participant.LastName LIKE @ParticipantName OR Participant.LastName +' '+ Participant.FirstName LIKE @ParticipantName)")
            strBuilder.Append(")")
        End If
        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strParticipantCasesConn)
        If HasParameters Then
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@FirstName", FirstName)
            cmd.Parameters.AddWithValue("@LastName", LastName)
            cmd.Parameters.AddWithValue("@ParticipantName", "%" & ParticipantName.ToString.Replace(" ", "%") & "%")
        End If
        If strParticipantCasesConn.State = ConnectionState.Closed Then strParticipantCasesConn.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        If rdr.HasRows Then
            Do While rdr.Read()
                dr = dt.NewRow()
                dr("ParticipantID") = rdr("ParticipantID")
                dr("ParticipantGUID") = rdr("ParticipantGUID")
                dr("ParticipantName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                dr("ParticipantNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)
                dr("SSN") = "XXX-XX-" & IIf(IsDBNull(rdr("SSN")), "0000", Right(rdr("SSN").ToString, 4))
                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                If IsDate(rdr("DOB")) Then
                    dr("Age") = DateDiff(DateInterval.Year, CDate(rdr("DOB").ToString), Now)
                    dr("DOB") = IIf(IsDate(rdr("DOB")), CDate(rdr("DOB")).ToShortDateString, DBNull.Value)
                End If
                dr("Address") = rdr("Address").ToString.Trim
                dr("Address2") = rdr("Address2").ToString.Trim
                dr("City") = rdr("City").ToString.Trim
                dr("State") = rdr("State").ToString.Trim
                dr("ZipCode") = rdr("ZipCode")
                dr("Phone") = rdr("Phone")
                dr("Comments") = rdr("Comments")
                dt.Rows.Add(dr)
            Loop
        End If
        If strParticipantCasesConn.State = ConnectionState.Open Then strParticipantCasesConn.Close()
        Return dt
    End Function
    Public Shared Function getAllParticipantNames() As DataSet
        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Participant.FirstName +' ' + Participant.LastName) AS ParticipantNameReverse FROM Participant INNER JOIN Role ON Participant.RoleID = Role.RoleID WHERE Participant.RoleID NOT IN (91,92);")
    End Function
End Class