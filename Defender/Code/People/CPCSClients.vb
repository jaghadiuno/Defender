Imports System.Data.SqlClient
Imports Defender.SiteGeneral
Imports Microsoft.VisualBasic

Public Class CPCSClients


    Public Shared Function getClientDetails(ByVal ClientGUID As Guid) As DataTable



        Dim strClientCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")



        dt.Columns.Add("ClientID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ClientGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientName", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("SSN", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("HeightInches", Type.[GetType]("System.Int32"))
        dt.Columns.Add("WeightPounds", Type.[GetType]("System.Int32"))
        dt.Columns.Add("POB", Type.[GetType]("System.String"))
        dt.Columns.Add("Age", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DOB", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("PcfNumber", Type.[GetType]("System.String"))
        dt.Columns.Add("AKA", Type.[GetType]("System.String"))
        dt.Columns.Add("Address", Type.[GetType]("System.String"))
        dt.Columns.Add("Address2", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))
        dt.Columns.Add("State", Type.[GetType]("System.String"))
        dt.Columns.Add("ZipCode", Type.[GetType]("System.String"))
        dt.Columns.Add("Phone", Type.[GetType]("System.String"))
        dt.Columns.Add("DoNotDefend", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DoNotDefendCSS", Type.[GetType]("System.String"))
        dt.Columns.Add("EthnicityName", Type.[GetType]("System.String"))
        dt.Columns.Add("CitizenshipName", Type.[GetType]("System.String"))
        dt.Columns.Add("RaceName", Type.[GetType]("System.String"))
        dt.Columns.Add("GenderName", Type.[GetType]("System.String"))
        dt.Columns.Add("MaritalStatusName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Client.ClientID, Client.ClientGUID, Client.SSN, Client.FirstName, Client.MiddleName, Client.LastName, Client.HeightInches, Client.WeightPounds, Client.POB, Client.DOB, Client.PcfNumber, Client.AKA, Client.Address, Client.Address2, Client.City, Client.State, Client.ZipCode, Client.Phone, ISNULL(Client.DoNotDefend, 0) DoNotDefend, Ethnicity.EthnicityName, Citizenship.CitizenshipName, Race.RaceName, Gender.GenderName, MaritalStatus.MaritalStatusName FROM Client LEFT OUTER JOIN Citizenship ON Client.CitizenshipID = Citizenship.CitizenshipID LEFT OUTER JOIN Ethnicity ON Client.EthnicityID = Ethnicity.EthnicityID LEFT OUTER JOIN Gender ON Client.GenderCode = Gender.GenderCode LEFT OUTER JOIN Race ON Client.RaceID = Race.RaceID LEFT OUTER JOIN MaritalStatus ON Client.MaritalStatusID = MaritalStatus.MaritalStatusID")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Client.ClientGUID = @ClientGUID")

        strBuilder.Append(")")




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strClientCasesConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ClientGUID", ClientGUID)



        If strClientCasesConn.State = ConnectionState.Closed Then strClientCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ClientID") = rdr("ClientID")
                dr("ClientGUID") = rdr("ClientGUID")

                dr("ClientName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("ClientNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)


                dr("SSN") = "XXX-XX-" & IIf(IsDBNull(rdr("SSN")), "0000", Right(rdr("SSN").ToString, 4))

                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                dr("HeightInches") = rdr("HeightInches")
                dr("WeightPounds") = rdr("WeightPounds")

                dr("POB") = rdr("POB")

                If IsDate(rdr("DOB")) Then
                    dr("Age") = DateDiff(DateInterval.Year, CDate(rdr("DOB").ToString), Now)
                    dr("DOB") = IIf(IsDate(rdr("DOB")), CDate(rdr("DOB")).ToShortDateString, DBNull.Value)
                End If


                dr("PcfNumber") = rdr("PcfNumber")
                dr("AKA") = rdr("AKA")
                dr("Address") = rdr("Address").ToString.Trim
                dr("Address2") = rdr("Address2").ToString.Trim
                dr("City") = rdr("City").ToString.Trim
                dr("State") = rdr("State").ToString.Trim
                dr("ZipCode") = rdr("ZipCode")
                dr("Phone") = rdr("Phone")

                dr("DoNotDefend") = rdr("DoNotDefend")
                dr("DoNotDefendCSS") = IIf(rdr("DoNotDefend").ToString = "1", "text-danger", "text-success")

                dr("EthnicityName") = rdr("EthnicityName")
                dr("CitizenshipName") = rdr("CitizenshipName")
                dr("RaceName") = rdr("RaceName")
                dr("GenderName") = rdr("GenderName")
                dr("MaritalStatusName") = rdr("MaritalStatusName")




                dt.Rows.Add(dr)

            Loop

        End If


        If strClientCasesConn.State = ConnectionState.Open Then strClientCasesConn.Close()


        Return dt

    End Function


    Public Shared Function getClientName(ByVal ClientGUID As Guid) As String


        Dim strClientName As String = String.Empty

        Dim strClientNameConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)




        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Client.ClientID, Client.ClientGUID, Client.FirstName, Client.MiddleName, Client.LastName FROM Client")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Client.ClientGUID = @ClientGUID")

        strBuilder.Append(")")




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strClientNameConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ClientGUID", ClientGUID)



        If strClientNameConn.State = ConnectionState.Closed Then strClientNameConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                'strClientName = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                strClientName = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)

            Loop

        End If


        If strClientNameConn.State = ConnectionState.Open Then strClientNameConn.Close()


        Return strClientName

    End Function


    Public Shared Function getAllClients(Optional ByVal FirstName As String = "", Optional ByVal LastName As String = "", Optional ByVal ClientName As String = "") As DataTable

        Dim HasParameters As Boolean = False

        If Not String.IsNullOrWhiteSpace(FirstName.ToString & LastName.ToString.Trim & ClientName.ToString.Trim) Then
            HasParameters = True
        End If


        Dim strAllClientsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")



        dt.Columns.Add("ClientID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ClientGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientName", Type.[GetType]("System.String"))
        dt.Columns.Add("ClientNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("SSN", Type.[GetType]("System.String"))
        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("HeightInches", Type.[GetType]("System.Int32"))
        dt.Columns.Add("WeightPounds", Type.[GetType]("System.Int32"))
        dt.Columns.Add("POB", Type.[GetType]("System.String"))
        dt.Columns.Add("Age", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DOB", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("PcfNumber", Type.[GetType]("System.String"))
        dt.Columns.Add("AKA", Type.[GetType]("System.String"))
        dt.Columns.Add("Address", Type.[GetType]("System.String"))
        dt.Columns.Add("Address2", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))
        dt.Columns.Add("State", Type.[GetType]("System.String"))
        dt.Columns.Add("ZipCode", Type.[GetType]("System.String"))
        dt.Columns.Add("Phone", Type.[GetType]("System.String"))
        dt.Columns.Add("DoNotDefend", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DoNotDefendCSS", Type.[GetType]("System.String"))
        dt.Columns.Add("EthnicityName", Type.[GetType]("System.String"))
        dt.Columns.Add("CitizenshipName", Type.[GetType]("System.String"))
        dt.Columns.Add("RaceName", Type.[GetType]("System.String"))
        dt.Columns.Add("GenderName", Type.[GetType]("System.String"))
        dt.Columns.Add("MaritalStatusName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT TOP 1000 Client.ClientID, Client.ClientGUID, Client.SSN, Client.FirstName, Client.MiddleName, Client.LastName, Client.HeightInches, Client.WeightPounds, Client.POB, Client.DOB, Client.PcfNumber, Client.AKA, Client.Address, Client.Address2, Client.City, Client.State, Client.ZipCode, Client.Phone, ISNULL(Client.DoNotDefend, 0) DoNotDefend, Ethnicity.EthnicityName, Citizenship.CitizenshipName, Race.RaceName, Gender.GenderName, MaritalStatus.MaritalStatusName FROM Client LEFT OUTER JOIN Citizenship ON Client.CitizenshipID = Citizenship.CitizenshipID LEFT OUTER JOIN Ethnicity ON Client.EthnicityID = Ethnicity.EthnicityID LEFT OUTER JOIN Gender ON Client.GenderCode = Gender.GenderCode LEFT OUTER JOIN Race ON Client.RaceID = Race.RaceID LEFT OUTER JOIN MaritalStatus ON Client.MaritalStatusID = MaritalStatus.MaritalStatusID")


        If HasParameters Then

            strBuilder.Append(" WHERE")
            strBuilder.Append(" (")

            strBuilder.Append("Client.ClientID IS NOT NULL")

            If FirstName <> "" Then strBuilder.Append(" AND Client.FirstName = @FirstName")
            If LastName <> "" Then strBuilder.Append(" AND Client.LastName = @LastName")
            If ClientName <> "" Then strBuilder.Append(" AND (Client.FirstName +' '+ Client.LastName LIKE @ClientName OR Client.LastName +' '+ Client.FirstName LIKE @ClientName)")

            strBuilder.Append(")")

        End If




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllClientsConn)


        If HasParameters Then
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@FirstName", FirstName)
            cmd.Parameters.AddWithValue("@LastName", LastName)
            cmd.Parameters.AddWithValue("@ClientName", "%" & ClientName.ToString.Replace(" ", "%") & "%")
        End If





        If strAllClientsConn.State = ConnectionState.Closed Then strAllClientsConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ClientID") = rdr("ClientID")
                dr("ClientGUID") = rdr("ClientGUID")

                dr("ClientName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("ClientNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)


                dr("SSN") = "XXX-XX-" & IIf(IsDBNull(rdr("SSN")), "0000", Right(rdr("SSN").ToString, 4))

                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim
                dr("HeightInches") = rdr("HeightInches")
                dr("WeightPounds") = rdr("WeightPounds")

                dr("POB") = rdr("POB")

                If IsDate(rdr("DOB")) Then
                    dr("Age") = DateDiff(DateInterval.Year, CDate(rdr("DOB").ToString), Now)
                    dr("DOB") = IIf(IsDate(rdr("DOB")), CDate(rdr("DOB")).ToShortDateString, DBNull.Value)
                End If


                dr("PcfNumber") = rdr("PcfNumber")
                dr("AKA") = rdr("AKA")
                dr("Address") = rdr("Address").ToString.Trim
                dr("Address2") = rdr("Address2").ToString.Trim
                dr("City") = rdr("City").ToString.Trim
                dr("State") = rdr("State").ToString.Trim
                dr("ZipCode") = rdr("ZipCode")
                dr("Phone") = rdr("Phone")

                dr("DoNotDefend") = rdr("DoNotDefend")
                dr("DoNotDefendCSS") = IIf(rdr("DoNotDefend").ToString = "1", "text-danger", "text-success")

                dr("EthnicityName") = rdr("EthnicityName")
                dr("CitizenshipName") = rdr("CitizenshipName")
                dr("RaceName") = rdr("RaceName")
                dr("GenderName") = rdr("GenderName")
                dr("MaritalStatusName") = rdr("MaritalStatusName")




                dt.Rows.Add(dr)

            Loop

        End If


        If strAllClientsConn.State = ConnectionState.Open Then strAllClientsConn.Close()


        Return dt

    End Function



    Public Shared Function getAllClientNames() As DataSet


        'Dim xFilteredView As New DataView(getAllClients)
        'Return xFilteredView


        'Return DB.RetrieveDataSet("SELECT DISTINCT Client.FirstName +' '+ ISNULL(Client.MiddleName, '') + ' ' + Client.LastName AS ClientNameReverse FROM Client;")

        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Client.FirstName +' ' + Client.LastName) AS ClientNameReverse FROM Client;")

    End Function


    Public Shared Function getClientGUID(ByVal CaseGUID As Guid) As Guid


        Dim strClientGUID As Guid

        Dim strClientGUIDConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)




        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT DISTINCT Client.ClientGUID FROM [Case] LEFT OUTER JOIN Client ON [Case].ClientID=Client.ClientID")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("[Case].CaseGUID = @CaseGUID")

        strBuilder.Append(")")




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strClientGUIDConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@CaseGUID", CaseGUID)



        If strClientGUIDConn.State = ConnectionState.Closed Then strClientGUIDConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                strClientGUID = rdr("ClientGUID")

            Loop

        End If


        If strClientGUIDConn.State = ConnectionState.Open Then strClientGUIDConn.Close()


        Return strClientGUID

    End Function


End Class



