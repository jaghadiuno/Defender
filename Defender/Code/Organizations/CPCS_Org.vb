Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCS_Org

    Public Shared Function getStructure() As DataTable



        Dim strAllClientsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")



        dt.Columns.Add("UnitID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("DivisionName", Type.[GetType]("System.String"))
        dt.Columns.Add("OfficeName", Type.[GetType]("System.String"))
        dt.Columns.Add("UnitTypeName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT [UnitID], [DivisionName], [OfficeName], [UnitTypeName] FROM [Unit]  INNER JOIN dbo.Division ON Unit.DivisionID = dbo.Division.DivisionID INNER JOIN Dbo.Office ON  Unit.OfficeID = Office.OfficeID INNER JOIN dbo.UnitType ON Unit.UnitTypeID = dbo.UnitType.UnitTypeID")


        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllClientsConn)

        If strAllClientsConn.State = ConnectionState.Closed Then strAllClientsConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                dr = dt.NewRow()

                dr("UnitID") = rdr("UnitID")
                dr("DivisionName") = rdr("DivisionName").ToString.Trim
                dr("OfficeName") = rdr("OfficeName").ToString.Trim
                dr("UnitTypeName") = rdr("UnitTypeName").ToString.Trim

                dt.Rows.Add(dr)

            Loop

        End If


        If strAllClientsConn.State = ConnectionState.Open Then strAllClientsConn.Close()


        Return dt

    End Function




    Public Shared Function getStructureDivision(Optional ByVal divisionName As String = "") As DataTable



        Dim strAllClientsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")


        dt.Columns.Add("DivisionName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT DISTINCT [DivisionName] FROM [Unit] INNER JOIN dbo.Division ON Unit.DivisionID = dbo.Division.DivisionID INNER JOIN Dbo.Office ON  Unit.OfficeID = Office.OfficeID INNER JOIN dbo.UnitType ON Unit.UnitTypeID = dbo.UnitType.UnitTypeID")

        If String.IsNullOrEmpty(divisionName) AndAlso Not IsNothing(divisionName) Then

            strBuilder.Append(" WHERE DivisionName = " & divisionName & "")
        End If

        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllClientsConn)

        If strAllClientsConn.State = ConnectionState.Closed Then strAllClientsConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                dr = dt.NewRow()

                dr("DivisionName") = rdr("DivisionName").ToString.Trim

                dt.Rows.Add(dr)

            Loop

        End If


        If strAllClientsConn.State = ConnectionState.Open Then strAllClientsConn.Close()


        Return dt

    End Function



    Public Shared Function getStructureUnit(Optional ByVal divisionName As String = "", Optional ByVal UnitTypeName As String = "") As DataTable



        Dim strAllClientsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")



        dt.Columns.Add("UnitTypeName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT DISTINCT [UnitTypeName] FROM [Unit] INNER JOIN dbo.Division ON Unit.DivisionID = dbo.Division.DivisionID INNER JOIN Dbo.Office ON  Unit.OfficeID = Office.OfficeID INNER JOIN dbo.UnitType ON Unit.UnitTypeID = dbo.UnitType.UnitTypeID WHERE UnitTypeName IS NOT NULL")




        If String.IsNullOrEmpty(divisionName) AndAlso Not IsNothing(divisionName) Then
            strBuilder.Append(" AND DivisionName = " & divisionName & "")
        End If


        If String.IsNullOrEmpty(UnitTypeName) AndAlso Not IsNothing(UnitTypeName) Then
            strBuilder.Append(" AND UnitTypeName = " & UnitTypeName & "")
        End If




        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllClientsConn)

        If strAllClientsConn.State = ConnectionState.Closed Then strAllClientsConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                dr = dt.NewRow()

                dr("UnitTypeName") = rdr("UnitTypeName").ToString.Trim

                dt.Rows.Add(dr)

            Loop

        End If


        If strAllClientsConn.State = ConnectionState.Open Then strAllClientsConn.Close()


        Return dt

    End Function




    Public Shared Function getStructureOffice(Optional ByVal divisionName As String = "", Optional ByVal UnitTypeName As String = "", Optional ByVal OfficeName As String = "") As DataTable



        Dim strAllClientsConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)


        Dim dt As New DataTable("ClientInfoTable")



        dt.Columns.Add("OfficeName", Type.[GetType]("System.String"))



        Dim dr As DataRow



        Dim strBuilder As New StringBuilder


        strBuilder.Append("SELECT DISTINCT [OfficeName] FROM [Unit] INNER JOIN dbo.Division ON Unit.DivisionID = dbo.Division.DivisionID INNER JOIN Dbo.Office ON  Unit.OfficeID = Office.OfficeID INNER JOIN dbo.UnitType ON Unit.UnitTypeID = dbo.UnitType.UnitTypeID WHERE OfficeName IS NOT NULL")




        If String.IsNullOrEmpty(divisionName) AndAlso Not IsNothing(divisionName) Then
            strBuilder.Append(" And divisionName = " & divisionName & "")
        End If




        If String.IsNullOrEmpty(UnitTypeName) AndAlso Not IsNothing(UnitTypeName) Then
            strBuilder.Append(" And UnitTypeName = " & UnitTypeName & "")
        End If




        If String.IsNullOrEmpty(OfficeName) AndAlso Not IsNothing(OfficeName) Then
            strBuilder.Append(" And UnitTypeName = " & OfficeName & "")
        End If



        Dim cmd As SqlCommand = New SqlCommand(strBuilder.ToString, strAllClientsConn)

        If strAllClientsConn.State = ConnectionState.Closed Then strAllClientsConn.Open()

        Dim rdr As SqlDataReader = cmd.ExecuteReader()

        If rdr.HasRows Then

            Do While rdr.Read()

                dr = dt.NewRow()

                dr("OfficeName") = SiteGeneral.GetTitleCase(rdr("OfficeName").ToString.Trim)

                dt.Rows.Add(dr)

            Loop

        End If


        If strAllClientsConn.State = ConnectionState.Open Then strAllClientsConn.Close()


        Return dt

    End Function





    Public Shared Function getAllOfficeNames() As DataSet

        Return DB.RetrieveDataSet("SELECT DISTINCT OfficeID, UPPER(OfficeName) OfficeName FROM Office;")

    End Function


    Public Shared Function getAllUnitNames() As DataSet

        Return DB.RetrieveDataSet("SELECT DISTINCT UnitTypeID, UnitTypeName FROM UnitType;")

    End Function


    Public Shared Function getAllDivisionNames() As DataSet

        Return DB.RetrieveDataSet("SELECT DISTINCT DivisionID, DivisionName FROM Division;")

    End Function




End Class
