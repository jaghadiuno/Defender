Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class PeopleSearch



    Public Shared Function SearchResults(ByVal personName As String, Optional ByVal searchType As Int32 = 0, Optional ByVal DOB As String = "", Optional ByVal dobRange As Int32 = 0, Optional ByVal phoneNumber As String = "", Optional ByVal streetAddress As String = "", Optional ByVal city As String = "", Optional ByVal state As String = "", Optional ByVal zipCode As String = "", Optional ByVal staffName As String = "", Optional ByVal participantRoles As String = "", Optional ByVal caseNumber As String = "") As DataTable


        Dim strPeopleSearchConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)

        Dim str As String
        Dim strArr() As String
        Dim count As Integer



        Dim dt As New DataTable("PeopleSearchTable")


        Dim PeopleSearchID As DataColumn = New DataColumn
        PeopleSearchID.DataType = System.Type.GetType("System.Int32")
        PeopleSearchID.AllowDBNull = False
        PeopleSearchID.Caption = "PeopleSearchID"
        PeopleSearchID.ColumnName = "PeopleSearchID"

        PeopleSearchID.AutoIncrement = True
        PeopleSearchID.AutoIncrementSeed = 1
        PeopleSearchID.AutoIncrementStep = 1


        dt.Columns.Add(PeopleSearchID)


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


        strBuilder.Append("SELECT TOP 1000 [ParticipantRole], [ParticipantGUID], [ParticipantFirstName], [ParticipantMiddleName], [ParticipantLastName], [ParticipantAddress], [ParticipantCity], [ParticipantState], [ParticipantZipCode], [ParticipantPhone], [ParticipantDOB], [CaseID], [CaseGUID], [CaseNumber], [CaseOpened], [CaseClosed], IsNull([CaseLeadChargeOffense], '~Charge information not available~') AS CaseLeadChargeOffense, ISNULL([CaseLeadChargeDisposition], '~Disposition information not available~') AS CaseLeadChargeDisposition, [AttorneyID], [AttorneyGUID], [AttorneyFirstName], [AttorneyLastName], [ClientID], [ClientGUID], [ClientFirstName], [ClientLastName] FROM df_VW_Conflict_Check")


        strBuilder.Append(" WHERE")

        strBuilder.Append(" (")

        If searchType = 1 Then

            strBuilder.Append("SOUNDEX(ParticipantFirstName + ParticipantLastName) = SOUNDEX(@SoundexName) OR SOUNDEX(ParticipantLastName + ParticipantFirstName) = SOUNDEX(@SoundexName)")

        Else
            strBuilder.Append("(ParticipantFirstName +' '+ ParticipantLastName LIKE @PersonName OR ParticipantLastName +' '+ ParticipantFirstName LIKE @PersonName)")
        End If

        strBuilder.Append(")")



        If IsDate(DOB) Then
            If dobRange <> 0 Then
                strBuilder.Append(" AND (ParticipantDOB BETWEEN @MinDOB AND @MaxDOB)")
            Else
                strBuilder.Append(" AND (ParticipantDOB = @DOB)")
            End If
        End If


        If Not String.IsNullOrWhiteSpace(phoneNumber) Then
            strBuilder.Append(" AND ParticipantPhone LIKE @Phone")
        End If

        If Not String.IsNullOrWhiteSpace(streetAddress) Then
            strBuilder.Append(" AND ParticipantAddress LIKE @Address")
        End If

        If Not String.IsNullOrWhiteSpace(city) Then
            strBuilder.Append(" AND ParticipantCity LIKE @City")
        End If

        If Not String.IsNullOrWhiteSpace(state) Then
            strBuilder.Append(" AND ParticipantState LIKE @State")
        End If

        If Not String.IsNullOrWhiteSpace(zipCode) Then
            strBuilder.Append(" AND ParticipantZipCode LIKE @ZipCode")
        End If

        If Not String.IsNullOrWhiteSpace(caseNumber) Then
            strBuilder.Append(" AND CaseNumber LIKE @CaseNumber")
        End If



        If Not String.IsNullOrWhiteSpace(participantRoles) AndAlso Not IsNothing(participantRoles) Then

            str = participantRoles
            strArr = str.Split(",")

            strBuilder.Append(" AND (ParticipantRole = 'DUMMY'")

            For count = 0 To strArr.Length - 1
                strBuilder.Append(" OR UPPER(ParticipantRole) = @ParticipantRoles" + count.ToString)
            Next

            strBuilder.Append(")")

        End If



        If Not String.IsNullOrWhiteSpace(staffName) Then
            strBuilder.Append(" AND ISNULL(AttorneyFirstName, '') + ' ' + ISNULL(AttorneyLastName, '') LIKE @StaffName")
        End If



        'If searchType = 1 Then
        strBuilder.Append(" ORDER BY [dbo].[Levenshtein_Distance](ParticipantFirstName + ParticipantLastName, @UnformattedName)")
            'Else
            '    strBuilder.Append(" ORDER BY CaseClosed DESC")
            'End If



            Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strPeopleSearchConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@PersonName", "%" & personName.ToString.Replace(" ", "%").Trim & "%")

        cmd.Parameters.AddWithValue("@UnformattedName", personName.Trim)
        cmd.Parameters.AddWithValue("@SoundexName", personName.Trim.Replace(" ", "").Trim)



        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@DOB", CDate(DOB))
        End If

        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@MinDOB", CDate(DOB).AddYears(-dobRange))
        End If

        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@MaxDOB", CDate(DOB).AddYears(dobRange))
        End If

        If Not String.IsNullOrWhiteSpace(phoneNumber) Then
            cmd.Parameters.AddWithValue("@Phone", phoneNumber.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(streetAddress) Then
            cmd.Parameters.AddWithValue("@Address", "%" & streetAddress.Trim & "%")
        End If

        If Not String.IsNullOrWhiteSpace(city) Then
            cmd.Parameters.AddWithValue("@City", city.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(state) Then
            cmd.Parameters.AddWithValue("@State", state.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(zipCode) Then
            cmd.Parameters.AddWithValue("@ZipCode", zipCode.Trim)
        End If


        If Not String.IsNullOrWhiteSpace(caseNumber) Then
            cmd.Parameters.AddWithValue("@CaseNumber", "%" & caseNumber.Trim & "%")
        End If


        If Not String.IsNullOrWhiteSpace(staffName) Then
            cmd.Parameters.AddWithValue("@StaffName", "" & staffName.Trim & "")
        End If



        If Not String.IsNullOrWhiteSpace(participantRoles) Then

            For count = 0 To strArr.Length - 1
                cmd.Parameters.AddWithValue("@ParticipantRoles" + count.ToString, strArr(count).ToUpper)
            Next

        End If


        If cmd.Parameters.Item("@UnformattedName").Value.ToString.Trim <> "" Then

            If strPeopleSearchConn.State = ConnectionState.Closed Then strPeopleSearchConn.Open()

            Dim rdr As SqlDataReader = cmd.ExecuteReader()

            If rdr.HasRows Then

                Do While rdr.Read()


                    dr = dt.NewRow()

                    dr("ParticipantGUID") = rdr("ParticipantGUID").ToString

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
                    dr("CaseGUID") = rdr("CaseGUID").ToString
                    dr("CaseNumber") = rdr("CaseNumber").ToString

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


            If strPeopleSearchConn.State = ConnectionState.Open Then strPeopleSearchConn.Close()

        End If

        Return dt

    End Function


    Public Shared Function SearchResultsPredicate(ByVal personName As String, Optional ByVal DOB As String = "", Optional ByVal dobRange As Int32 = 0, Optional ByVal phoneNumber As String = "", Optional ByVal streetAddress As String = "", Optional ByVal city As String = "", Optional ByVal state As String = "", Optional ByVal zipCode As String = "", Optional ByVal staffName As String = "", Optional ByVal participantRoles As String = "", Optional ByVal caseNumber As String = "") As DataTable


        Dim strPeopleSearchConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)

        Dim str As String
        Dim strArr() As String
        Dim count As Integer



        Dim dt As New DataTable("PeopleSearchTable")


        Dim PeopleSearchID As DataColumn = New DataColumn
        PeopleSearchID.DataType = System.Type.GetType("System.Int32")
        PeopleSearchID.AllowDBNull = False
        PeopleSearchID.Caption = "PeopleSearchID"
        PeopleSearchID.ColumnName = "PeopleSearchID"

        PeopleSearchID.AutoIncrement = True
        PeopleSearchID.AutoIncrementSeed = 1
        PeopleSearchID.AutoIncrementStep = 1


        dt.Columns.Add(PeopleSearchID)


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




        strBuilder.Append(" WITH [LeadCharges]")
        strBuilder.Append(" AS")
        strBuilder.Append(" (")
        strBuilder.Append(" SELECT CaseNumber, MIN(CaseChargeID) 'CaseChargeID'")
        strBuilder.Append(" FROM CaseCharge")
        strBuilder.Append(" WHERE IsLeadCharge = 1")
        strBuilder.Append(" GROUP BY CaseNumber")
        strBuilder.Append(" ),")
        strBuilder.Append(" [PrimaryAttorneys]")
        strBuilder.Append(" AS")
        strBuilder.Append(" (")
        strBuilder.Append(" SELECT CaseNumber, MIN(AttorneyID) 'AttorneyID'")
        strBuilder.Append(" FROM CaseAttorney")
        strBuilder.Append(" WHERE AssignmentTypeID = 1")
        strBuilder.Append(" GROUP BY CaseNumber")
        strBuilder.Append(" )")
        strBuilder.Append(" SELECT")

        strBuilder.Append(" r.RoleName 'ParticipantRole',")
        strBuilder.Append(" p.ParticipantID 'ParticipantID',")
        strBuilder.Append(" p.ParticipantGUID 'ParticipantGUID',")
        strBuilder.Append(" p.FirstName 'ParticipantFirstName',")
        strBuilder.Append(" p.MiddleName 'ParticipantMiddleName',")
        strBuilder.Append(" p.LastName 'ParticipantLastName',")
        strBuilder.Append(" p.[Address] 'ParticipantAddress',")
        strBuilder.Append(" p.City 'ParticipantCity',")
        strBuilder.Append(" p.[State] 'ParticipantState',")
        strBuilder.Append(" p.ZIPCode 'ParticipantZIPCode',")
        strBuilder.Append(" p.Phone 'ParticipantPhone',")
        strBuilder.Append(" p.DOB 'ParticipantDOB',")
        strBuilder.Append(" c.CaseID 'CaseID',")
        strBuilder.Append(" c.CaseGUID 'CaseGUID',")
        strBuilder.Append(" c.CaseNumber 'CaseNumber',")
        strBuilder.Append(" c.OpeningDate 'CaseOpened',")
        strBuilder.Append(" c.ClosingDate 'CaseClosed',")
        strBuilder.Append(" ch.Offense 'CaseLeadChargeOffense',")
        strBuilder.Append(" d.DispositionName 'CaseLeadChargeDisposition',")
        strBuilder.Append(" a.AttorneyID 'AttorneyID',")
        strBuilder.Append(" a.AttorneyGUID 'AttorneyGUID',")
        strBuilder.Append(" a.FirstName 'AttorneyFirstName',")
        strBuilder.Append(" a.LastName 'AttorneyLastName',")
        strBuilder.Append(" cl.ClientID 'ClientID',")
        strBuilder.Append(" cl.ClientGUID 'ClientGUID',")
        strBuilder.Append(" cl.FirstName 'ClientFirstName',")
        strBuilder.Append(" cl.LastName 'ClientLastName'")

        strBuilder.Append(" FROM Participant p")
        strBuilder.Append(" INNER JOIN [Role] r")
        strBuilder.Append(" ON r.RoleID = p.RoleID")
        strBuilder.Append(" INNER JOIN [Case] c")
        strBuilder.Append(" ON c.CaseNumber = p.CaseNumber")
        strBuilder.Append(" LEFT JOIN [LeadCharges] lc")
        strBuilder.Append(" ON lc.CaseNumber = c.CaseNumber")
        strBuilder.Append(" LEFT JOIN CaseCharge cc")
        strBuilder.Append(" ON cc.CaseChargeID = lc.CaseChargeID")
        strBuilder.Append(" LEFT JOIN Disposition d")
        strBuilder.Append(" ON d.DispositionID = cc.DispositionID")
        strBuilder.Append(" LEFT JOIN Charge ch")
        strBuilder.Append(" ON ch.ChargeID = cc.ChargeID")
        strBuilder.Append(" LEFT JOIN [PrimaryAttorneys] pa")
        strBuilder.Append(" ON pa.CaseNumber = c.CaseNumber")
        strBuilder.Append(" LEFT JOIN Attorney a")
        strBuilder.Append(" ON a.AttorneyID = pa.AttorneyID")
        strBuilder.Append(" LEFT JOIN Client cl")
        strBuilder.Append(" ON cl.ClientID = c.ClientID")

        strBuilder.Append(" UNION ALL")

        strBuilder.Append(" SELECT")

        strBuilder.Append(" 'Client' 'ParticipantRole',")
        strBuilder.Append(" cl.ClientID 'ParticipantID',")
        strBuilder.Append(" cl.ClientGUID 'ParticipantGUID',")
        strBuilder.Append(" cl.FirstName 'ParticipantFirstName',")
        strBuilder.Append(" LEFT(cl.MiddleName, 1) 'ParticipantMiddleName',")
        strBuilder.Append(" cl.LastName 'ParticipantLastName',")
        strBuilder.Append(" cl.[Address] 'ParticipantAddress',")
        strBuilder.Append(" cl.City 'ParticipantCity',")
        strBuilder.Append(" cl.[State] 'ParticipantState',")
        strBuilder.Append(" cl.ZIPCode 'ParticipantZIPCode',")
        strBuilder.Append(" cl.Phone 'ParticipantPhone',")
        strBuilder.Append(" cl.DOB 'ParticipantDOB',")
        strBuilder.Append(" c.CaseID 'CaseID',")
        strBuilder.Append(" c.CaseGUID 'CaseGUID',")
        strBuilder.Append(" c.CaseNumber 'CaseNumber',")
        strBuilder.Append(" c.OpeningDate 'CaseOpened',")
        strBuilder.Append(" c.ClosingDate 'CaseClosed',")
        strBuilder.Append(" ch.Offense 'CaseLeadChargeOffense',")
        strBuilder.Append(" d.DispositionName 'CaseLeadChargeDisposition',")
        strBuilder.Append(" a.AttorneyID 'AttorneyID',")
        strBuilder.Append(" a.AttorneyGUID 'AttorneyGUID',")
        strBuilder.Append(" a.FirstName 'AttorneyFirstName',")
        strBuilder.Append(" a.LastName 'AttorneyLastName',")
        strBuilder.Append(" cl.ClientID 'ClientID',")
        strBuilder.Append(" cl.ClientGUID 'ClientGUID',")
        strBuilder.Append(" cl.FirstName 'ClientFirstName',")
        strBuilder.Append(" cl.LastName 'ClientLastName'")

        strBuilder.Append(" FROM Client cl")
        strBuilder.Append(" LEFT JOIN [Case] c")
        strBuilder.Append(" ON c.ClientID = cl.ClientID")
        strBuilder.Append(" LEFT JOIN [LeadCharges] lc")
        strBuilder.Append(" ON lc.CaseNumber = c.CaseNumber")
        strBuilder.Append(" LEFT JOIN CaseCharge cc")
        strBuilder.Append(" ON cc.CaseChargeID = lc.CaseChargeID")
        strBuilder.Append(" LEFT JOIN Disposition d")
        strBuilder.Append(" ON d.DispositionID = cc.DispositionID")
        strBuilder.Append(" LEFT JOIN Charge ch")
        strBuilder.Append(" ON ch.ChargeID = cc.ChargeID")
        strBuilder.Append(" LEFT JOIN [PrimaryAttorneys] pa")
        strBuilder.Append(" ON pa.CaseNumber = c.CaseNumber")
        strBuilder.Append(" LEFT JOIN Attorney a")
        strBuilder.Append(" ON a.AttorneyID = pa.AttorneyID")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("(ParticipantFirstName +' '+ ParticipantLastName LIKE @PersonName OR ParticipantLastName +' '+ ParticipantFirstName LIKE @PersonName)")

        strBuilder.Append(")")



        If IsDate(DOB) Then
            If dobRange <> 0 Then
                strBuilder.Append(" AND (ParticipantDOB BETWEEN @MinDOB AND @MaxDOB)")
            Else
                strBuilder.Append(" AND (ParticipantDOB = @DOB)")
            End If
        End If


        If Not String.IsNullOrWhiteSpace(phoneNumber) Then
            strBuilder.Append(" AND ParticipantPhone LIKE @Phone")
        End If

        If Not String.IsNullOrWhiteSpace(streetAddress) Then
            strBuilder.Append(" AND ParticipantAddress LIKE @Address")
        End If

        If Not String.IsNullOrWhiteSpace(city) Then
            strBuilder.Append(" AND ParticipantCity LIKE @City")
        End If

        If Not String.IsNullOrWhiteSpace(state) Then
            strBuilder.Append(" AND ParticipantState LIKE @State")
        End If

        If Not String.IsNullOrWhiteSpace(zipCode) Then
            strBuilder.Append(" AND ParticipantZipCode LIKE @ZipCode")
        End If

        If Not String.IsNullOrWhiteSpace(caseNumber) Then
            strBuilder.Append(" AND CaseNumber LIKE @CaseNumber")
        End If



        If Not String.IsNullOrWhiteSpace(participantRoles) AndAlso Not IsNothing(participantRoles) Then

            str = participantRoles
            strArr = str.Split(",")

            strBuilder.Append(" AND (ParticipantRole = 'DUMMY'")

            For count = 0 To strArr.Length - 1
                strBuilder.Append(" OR UPPER(ParticipantRole) = @ParticipantRoles" + count.ToString)
            Next

            strBuilder.Append(")")

        End If



        If Not String.IsNullOrWhiteSpace(staffName) Then
            strBuilder.Append(" AND ISNULL(AttorneyFirstName, '') + ' ' + ISNULL(AttorneyLastName, '') LIKE @StaffName")
        End If



        strBuilder.Append(" ORDER BY CaseClosed DESC")



        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strPeopleSearchConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@PersonName", "%" & personName.Trim & "%")
        cmd.Parameters.AddWithValue("@UnformattedName", personName.Trim)

        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@DOB", CDate(DOB))
        End If

        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@MinDOB", CDate(DOB).AddYears(-dobRange))
        End If

        If IsDate(DOB) Then
            cmd.Parameters.AddWithValue("@MaxDOB", CDate(DOB).AddYears(dobRange))
        End If

        If Not String.IsNullOrWhiteSpace(phoneNumber) Then
            cmd.Parameters.AddWithValue("@Phone", phoneNumber.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(streetAddress) Then
            cmd.Parameters.AddWithValue("@Address", "%" & streetAddress.Trim & "%")
        End If

        If Not String.IsNullOrWhiteSpace(city) Then
            cmd.Parameters.AddWithValue("@City", city.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(state) Then
            cmd.Parameters.AddWithValue("@State", state.Trim)
        End If

        If Not String.IsNullOrWhiteSpace(zipCode) Then
            cmd.Parameters.AddWithValue("@ZipCode", zipCode.Trim)
        End If


        If Not String.IsNullOrWhiteSpace(caseNumber) Then
            cmd.Parameters.AddWithValue("@CaseNumber", "%" & caseNumber.Trim & "%")
        End If


        If Not String.IsNullOrWhiteSpace(staffName) Then
            cmd.Parameters.AddWithValue("@StaffName", "" & staffName.Trim & "")
        End If



        If Not String.IsNullOrWhiteSpace(participantRoles) Then

            For count = 0 To strArr.Length - 1
                cmd.Parameters.AddWithValue("@ParticipantRoles" + count.ToString, strArr(count).ToUpper)
            Next

        End If


        If cmd.Parameters.Item("@UnformattedName").Value.ToString.Trim <> "" Then

            If strPeopleSearchConn.State = ConnectionState.Closed Then strPeopleSearchConn.Open()

            Dim rdr As SqlDataReader = cmd.ExecuteReader()

            If rdr.HasRows Then

                Do While rdr.Read()


                    dr = dt.NewRow()

                    dr("ParticipantGUID") = rdr("ParticipantGUID").ToString

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
                    dr("CaseGUID") = rdr("CaseGUID").ToString
                    dr("CaseNumber") = rdr("CaseNumber").ToString

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


            If strPeopleSearchConn.State = ConnectionState.Open Then strPeopleSearchConn.Close()

        End If

        Return dt

    End Function



    Public Shared Function getAllStaff() As DataTable



        Dim strStaffConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)

        Dim dt As New DataTable("AllStaffTable")


        dt.Columns.Add("StaffName", Type.[GetType]("System.String"))

        Dim dr As DataRow



        Dim commandStr As String = "SELECT DISTINCT ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '') AS StaffName FROM [Attorney] UNION ALL SELECT DISTINCT ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '') AS StaffName FROM Participant WHERE RoleID IN (91, 92);"


        Dim command As SqlCommand = New SqlCommand(
              commandStr, strStaffConn)

        If strStaffConn.State = ConnectionState.Closed Then strStaffConn.Open()

        Dim reader As SqlDataReader = command.ExecuteReader()

        If reader.HasRows Then

            Do While reader.Read()


                dr = dt.NewRow()


                dr("StaffName") = reader("StaffName")


                dt.Rows.Add(dr)

            Loop

        End If

        If strStaffConn.State = ConnectionState.Open Then strStaffConn.Close()

        Return dt

    End Function



    Public Shared Function getAllAttorneyNames() As DataTable




        Dim strAttorneyConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)

        Dim dt As New DataTable("AllAttorneysTable")


        dt.Columns.Add("AttorneyName", Type.[GetType]("System.String"))

        Dim dr As DataRow


        Dim commandStr As String = "SELECT DISTINCT ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '') AS StaffName FROM [Attorney];"



        Dim command As SqlCommand = New SqlCommand(
              commandStr, strAttorneyConn)

        If strAttorneyConn.State = ConnectionState.Closed Then strAttorneyConn.Open()

        Dim reader As SqlDataReader = command.ExecuteReader()

        If reader.HasRows Then

            Do While reader.Read()


                dr = dt.NewRow()


                dr("AttorneyName") = reader("AttorneyName")


                dt.Rows.Add(dr)

            Loop

        End If

        If strAttorneyConn.State = ConnectionState.Open Then strAttorneyConn.Close()

        Return dt

    End Function




    Public Shared Function getParticipantNames(Optional ByVal ParticipantName As String = "") As DataTable


        Dim strPeopleSearchConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)



        Dim dt As New DataTable("PeopleSearchTable")

        dt.Columns.Add("ParticipantName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT DISTINCT ParticipantFirstName +' '+ ParticipantLastName AS ParticipantName FROM df_VW_Conflict_Check")

        If ParticipantName <> "" Then strBuilder.Append(" WHERE (ParticipantFirstName +' '+ ParticipantLastName LIKE @ParticipantName OR ParticipantLastName +' '+ ParticipantFirstName LIKE @ParticipantName)")



        'strBuilder.Append("df_SP_Participants")


        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strPeopleSearchConn)
        'cmd.CommandType = CommandType.StoredProcedure


        'Command parameter goes in here
        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@ParticipantName", "%" & ParticipantName.ToString.Replace(" ", "%") & "%")


        If strPeopleSearchConn.State = ConnectionState.Closed Then strPeopleSearchConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ParticipantName") = rdr("ParticipantName").ToString.ToUpper

                dt.Rows.Add(dr)

            Loop

        End If


        If strPeopleSearchConn.State = ConnectionState.Open Then strPeopleSearchConn.Close()



        Return dt

    End Function







End Class



