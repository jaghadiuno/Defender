Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSProsecutors


    Public Shared Function getProsecutorDetails(ByVal ProsecutorGUID As Guid) As DataTable



        Dim strProsecutorCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ProsecutorInfoTable")



        dt.Columns.Add("ProsecutorID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ProsecutorGUID", Type.[GetType]("System.String"))

        dt.Columns.Add("ProsecutorName", Type.[GetType]("System.String"))
        dt.Columns.Add("ProsecutorNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))

        dt.Columns.Add("CaseCount", Type.[GetType]("System.Int32"))


        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Prosecutor.ProsecutorID, Prosecutor.ProsecutorGUID, Prosecutor.FirstName, Prosecutor.MiddleName, Prosecutor.LastName, SELECT COUNT(DISTINCT CaseNumber) Derv1 FROM [Case] WHERE [Case].ProsecutorID=Prosecutor.ProsecutorID) CaseCount FROM Prosecutor")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Prosecutor.ProsecutorGUID = @ProsecutorGUID")

        strBuilder.Append(")")




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strProsecutorCasesConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ProsecutorGUID", ProsecutorGUID)



        If strProsecutorCasesConn.State = ConnectionState.Closed Then strProsecutorCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ProsecutorID") = rdr("ProsecutorID")
                dr("ProsecutorGUID") = rdr("ProsecutorGUID")

                dr("ProsecutorName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("ProsecutorNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)



                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim

                dr("CaseCount") = rdr("CaseCount").ToString.Trim

                dt.Rows.Add(dr)

            Loop

        End If


        If strProsecutorCasesConn.State = ConnectionState.Open Then strProsecutorCasesConn.Close()


        Return dt

    End Function


    Public Shared Function getProsecutorName(ByVal ProsecutorGUID As Guid) As String


        Dim strProsecutorName As String = String.Empty

        Dim strProsecutorNameConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)




        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Prosecutor.ProsecutorID, Prosecutor.ProsecutorGUID, Prosecutor.FirstName, Prosecutor.MiddleName, Prosecutor.LastName FROM Prosecutor")


        strBuilder.Append(" WHERE")


        strBuilder.Append(" (")

        strBuilder.Append("Prosecutor.ProsecutorGUID = @ProsecutorGUID")

        strBuilder.Append(")")



        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strProsecutorNameConn)

        'Command parameter goes in here
        cmd.Parameters.AddWithValue("@ProsecutorGUID", ProsecutorGUID)



        If strProsecutorNameConn.State = ConnectionState.Closed Then strProsecutorNameConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                'strProsecutorName = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString
                strProsecutorName = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)

            Loop

        End If


        If strProsecutorNameConn.State = ConnectionState.Open Then strProsecutorNameConn.Close()


        Return strProsecutorName

    End Function



    Public Shared Function getAllProsecutors(Optional ByVal ProsecutorName As String = "") As DataTable

        Dim HasParameters As Boolean = False

        If Not String.IsNullOrWhiteSpace(ProsecutorName.ToString.Trim) Then
            HasParameters = True
        End If



        Dim strProsecutorCasesConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ProsecutorInfoTable")



        dt.Columns.Add("ProsecutorID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("CaseCount", Type.[GetType]("System.Int32"))
        dt.Columns.Add("ProsecutorGUID", Type.[GetType]("System.String"))
        dt.Columns.Add("ProsecutorName", Type.[GetType]("System.String"))
        dt.Columns.Add("ProsecutorNameReverse", Type.[GetType]("System.String"))


        dt.Columns.Add("FirstName", Type.[GetType]("System.String"))
        dt.Columns.Add("MiddleName", Type.[GetType]("System.String"))
        dt.Columns.Add("LastName", Type.[GetType]("System.String"))


        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT Prosecutor.ProsecutorID, Prosecutor.ProsecutorGUID, Prosecutor.FirstName, Prosecutor.MiddleName, Prosecutor.LastName, (SELECT COUNT(DISTINCT CaseNumber) Derv1 FROM [Case] WHERE [Case].ProsecutorID=Prosecutor.ProsecutorID) CaseCount FROM Prosecutor")




        If HasParameters Then

            strBuilder.Append(" WHERE")
            strBuilder.Append(" (")

            strBuilder.Append("Prosecutor.ProsecutorID IS NOT NULL")



            If ProsecutorName <> "" Then strBuilder.Append(" AND (Prosecutor.FirstName +' '+ Prosecutor.LastName LIKE @ProsecutorName OR Prosecutor.LastName +' '+ Prosecutor.FirstName LIKE @ProsecutorName)")





            strBuilder.Append(")")

        End If





        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strProsecutorCasesConn)




        If HasParameters Then
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ProsecutorName", "%" & ProsecutorName.Trim.Replace(" ", "%") & "%")
        End If



        If strProsecutorCasesConn.State = ConnectionState.Closed Then strProsecutorCasesConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()


                dr = dt.NewRow()

                dr("ProsecutorID") = rdr("ProsecutorID")
                dr("ProsecutorGUID") = rdr("ProsecutorGUID")

                dr("ProsecutorName") = rdr("LastName").ToString.Trim & ", " & rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString

                dr("ProsecutorNameReverse") = SiteGeneral.GetTitleCase(Trim(rdr("FirstName").ToString.Trim & " " & rdr("MiddleName").ToString & " " & rdr("LastName").ToString.Trim).ToLower)



                dr("FirstName") = rdr("FirstName").ToString.Trim
                dr("MiddleName") = rdr("MiddleName")
                dr("LastName") = rdr("LastName").ToString.Trim

                dr("CaseCount") = rdr("CaseCount").ToString.Trim



                dt.Rows.Add(dr)

            Loop

        End If


        If strProsecutorCasesConn.State = ConnectionState.Open Then strProsecutorCasesConn.Close()


        Return dt

    End Function



    Public Shared Function getAllProsecutorNames() As DataSet


        'Dim xFilteredView As New DataView(getAllProsecutors)
        'Return xFilteredView


        'Return DB.RetrieveDataSet("SELECT DISTINCT Prosecutor.FirstName +' '+ ISNULL(Prosecutor.MiddleName, '') + ' ' + Prosecutor.LastName AS ProsecutorNameReverse FROM Prosecutor;")

        Return DB.RetrieveDataSet("SELECT DISTINCT LOWER(Prosecutor.FirstName +' ' + Prosecutor.LastName) AS ProsecutorNameReverse FROM Prosecutor;")

    End Function






End Class



