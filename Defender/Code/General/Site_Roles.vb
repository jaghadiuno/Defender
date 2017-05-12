Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Public Class CPCSRoles
    Shared strConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
    Public Shared Function getNonStaffRoles() As DataTable
        Dim dt As New DataTable("NonStaffRolesTable")
        dt.Columns.Add("RoleID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("RoleName", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim commandStr As String = "SELECT 0 As RoleID, 'CLIENT' AS RoleName UNION ALL SELECT DISTINCT [RoleID], UPPER([RoleName]) AS RoleName FROM [Role] WHERE (RoleID <> 91 AND RoleID <> 92) ORDER BY [RoleName];"
        Dim command As SqlCommand = New SqlCommand(
        commandStr, strConn)
        If strConn.State = ConnectionState.Closed Then strConn.Open()
        Dim reader As SqlDataReader = command.ExecuteReader()
        If reader.HasRows Then
            Do While reader.Read()
                dr = dt.NewRow()
                dr("RoleName") = reader("RoleName")
                dr("RoleID") = reader("RoleID")
                dt.Rows.Add(dr)
            Loop
        End If
        If strConn.State = ConnectionState.Open Then strConn.Close()
        Return dt
    End Function
    Public Shared Function getAllRoles() As DataTable
        Dim dt As New DataTable("AllRolesTable")
        dt.Columns.Add("RoleID", Type.[GetType]("System.Int32"))
        dt.Columns.Add("RoleName", Type.[GetType]("System.String"))
        Dim dr As DataRow
        Dim commandStr As String = "SELECT 0, 'CLIENT' UNION ALL SELECT DISTINCT [RoleID], UPPER([RoleName]) AS RoleName FROM [Role] ORDER BY [RoleName];"
        Dim command As SqlCommand = New SqlCommand(
        commandStr, strConn)
        If strConn.State = ConnectionState.Closed Then strConn.Open()
        Dim reader As SqlDataReader = command.ExecuteReader()
        If reader.HasRows Then
            Do While reader.Read()
                dr = dt.NewRow()
                dr("RoleName") = reader("RoleName")
                dr("RoleID") = reader("RoleID")
                dt.Rows.Add(dr)
            Loop
        End If
        If strConn.State = ConnectionState.Open Then strConn.Close()
        Return dt
    End Function
End Class