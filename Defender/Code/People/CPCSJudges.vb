Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSJudges


    Public Shared Function getJudgeDetails(ByVal JudgeGUID As Guid) As DataTable



        Dim strJudgeCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("JudgeInfoTable")



        dt.Columns.Add("JudgeID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("JudgeGUID", Type.[GetType]("System.String"))

        dt.Columns.Add("JudgeName", Type.[GetType]("System.String"))
        dt.Columns.Add("JudgeNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))

        dt.Columns.Add("CaseCount", Type.[GetType]("System.Int32"))

        dt.Columns.Add("CourtLevelName", Type.[GetType]("System.String"))
        dt.Columns.Add("DepartmentName", Type.[GetType]("System.String"))

        dt.Columns.Add("CourtName", Type.[GetType]("System.String"))
        dt.Columns.Add("AddressLine1", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))

        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT [Judge].[JudgeID], [Judge].[CourtID], [Judge].[FirstName], [Judge].[MiddleName], [Judge].[LastName], [Judge].[JudgeGUID], [Court].[CourtName], [Court].[Location], [Court].[AddressLine1], [Court].[AddressLine2], [Court].[City], [Court].[CountyName], [Court].[State], [Court].[Zip], [Court].[Phone], [CourtLevel].[CourtLevelName], [Department].[DepartmentName],  (SELECT COUNT(DISTINCT [Case].[CaseNumber]) Derv1  FROM [Case]  WHERE [Case].JudgeID=Judge.JudgeID) CaseCount  FROM Judge  LEFT OUTER JOIN [Court] ON [Judge].[CourtID] = [Court].[CourtID]  LEFT OUTER JOIN [CourtLevel] ON  [Court].[CourtLevelID] = [CourtLevel].[CourtLevelID]  LEFT OUTER JOIN [Department] ON [Department].[DepartmentID] = [Court].[DepartmentID]")




        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Judge.JudgeGUID = @JudgeGUID")

        strBuilder.Append(")")




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strJudgeCasesConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@JudgeGUID", JudgeGUID)



        If strJudgeCasesConn.State = ConnectionState.Closed Then strJudgeCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("JudgeID") = rdr("JudgeID")
                dr("JudgeGUID") = rdr("JudgeGUID")

                dr("JudgeName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("JudgeNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)



                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim

                dr("CaseCount") = rdr("CaseCount").ToString.Trim


                dr("CourtName") = rdr("CourtName").ToString.Trim
                dr("AddressLine1") = rdr("AddressLine1").ToString.Trim
                dr("City") = rdr("City").ToString.Trim


                dt.Columns.Add("CourtLevelName", Type.[GetType]("System.String"))
                dt.Columns.Add("DepartmentName", Type.[GetType]("System.String"))


                dt.Rows.Add(dr)

            Loop

        End If


        If strJudgeCasesConn.State = ConnectionState.Open Then strJudgeCasesConn.Close()


        Return dt

    End Function


    Public Shared Function getJudgeName(ByVal JudgeGUID As Guid) As String


        Dim strJudgeName As String = String.Empty

        Dim strJudgeNameConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)




        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Judge.JudgeID, Judge.JudgeGUID, Judge.FirstName, Judge.MiddleName, Judge.LastName FROM Judge")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Judge.JudgeGUID = @JudgeGUID")

        strBuilder.Append(")")



        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strJudgeNameConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@JudgeGUID", JudgeGUID)



        If strJudgeNameConn.State = ConnectionState.Closed Then strJudgeNameConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                'strJudgeName = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                strJudgeName = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)

            Loop

        End If


        If strJudgeNameConn.State = ConnectionState.Open Then strJudgeNameConn.Close()


        Return strJudgeName

    End Function



    Public Shared Function getAllJudges(Optional ByVal JudgeName As String = "") As DataTable

        Dim HasParameters As Boolean = False

        If Not String.IsNullOrWhiteSpace(JudgeName.ToString.Trim) Then
            HasParameters = True
        End If



        Dim strJudgeCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("JudgeInfoTable")



        dt.Columns.Add("JudgeID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CaseCount", Type.[GetType]("System.Int32"))
        dt.Columns.Add("JudgeGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("JudgeName", Type.[GetType]("System.String"))
        dt.Columns.Add("JudgeNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))
        dt.Columns.Add("CourtLevelName", Type.[GetType]("System.String"))
        dt.Columns.Add("DepartmentName", Type.[GetType]("System.String"))


        dt.Columns.Add("CourtName", Type.[GetType]("System.String"))
        dt.Columns.Add("AddressLine1", Type.[GetType]("System.String"))
        dt.Columns.Add("City", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT [Judge].[JudgeID], [Judge].[CourtID], [Judge].[FirstName], [Judge].[MiddleName], [Judge].[LastName], [Judge].[JudgeGUID], [Court].[CourtName], [Court].[Location], [Court].[AddressLine1], [Court].[AddressLine2], [Court].[City], [Court].[CountyName], [Court].[State], [Court].[Zip], [Court].[Phone], [CourtLevel].[CourtLevelName], [Department].[DepartmentName],  (SELECT COUNT(DISTINCT [Case].[CaseNumber]) Derv1  FROM [Case]  WHERE [Case].JudgeID=Judge.JudgeID) CaseCount  FROM Judge  LEFT OUTER JOIN [Court] ON [Judge].[CourtID] = [Court].[CourtID]  LEFT OUTER JOIN [CourtLevel] ON  [Court].[CourtLevelID] = [CourtLevel].[CourtLevelID]  LEFT OUTER JOIN [Department] ON [Department].[DepartmentID] = [Court].[DepartmentID]")




        If HasParameters Then

            strBuilder.Append(" WHERE")
            strBuilder.Append(" (")

            strBuilder.Append("Judge.JudgeID IS NOT NULL")


            If JudgeName <> "" Then strBuilder.Append(" AND (Judge.FirstName +' '+ Judge.LastName LIKE @JudgeName OR Judge.LastName +' '+ Judge.FirstName LIKE @JudgeName)")




            strBuilder.Append(")")

        End If





        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strJudgeCasesConn)


        If HasParameters Then
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@JudgeName", "%" & JudgeName.Trim.Replace(" ", "%") & "%")
        End If



        If strJudgeCasesConn.State = ConnectionState.Closed Then strJudgeCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("JudgeID") = rdr("JudgeID")
                dr("JudgeGUID") = rdr("JudgeGUID")

                dr("JudgeName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("JudgeNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)



                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim

                dr("CaseCount") = rdr("CaseCount").ToString.Trim


                dr("CourtLevelName") = rdr("CourtLevelName").ToString.Trim
                dr("DepartmentName") = rdr("DepartmentName").ToString.Trim



                dr("CourtName") = rdr("CourtName").ToString.Trim
                dr("AddressLine1") = rdr("AddressLine1").ToString.Trim
                dr("City") = rdr("City").ToString.Trim



                dt.Rows.Add(dr)

            Loop

        End If


        If strJudgeCasesConn.State = ConnectionState.Open Then strJudgeCasesConn.Close()


        Return dt

    End Function



    Public Shared Function getAllJudgeNames() As DataSet


        'Dim xFilteredView As New DataView(getAllJudges)
        'Return xFilteredView


        'Return DB.RetrieveDataSet("SELECT DISTINCT Judge.FirstName +' '+ ISNULL(Judge.MiddleName, '') + ' ' + Judge.LastName AS JudgeNameReverse FROM Judge;")

        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Judge.FirstName +' ' + Judge.LastName) AS JudgeNameReverse FROM Judge;")

    End Function






End Class



