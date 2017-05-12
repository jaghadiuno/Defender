Imports System.Data.SqlClient
Imports System.Web.Security

Public Class SiteDAL

    Private Shared xRef As String
    Private Shared xRefID As String

    Private Shared strSQL, strSQLUpdate, strSQLInsert As String
    Property strConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
    Property DA As New SqlDataAdapter

    Shared DefaultStrSQL As String = "SELECT TOP 1000 [_Error_ID], [StackTrace], [ErrorMessage], [ErrorDate]  FROM [JohnA-Dev].[dbo].[_Errors]"

    Public Sub New()
        '
        ' TODO: Add constructor logic here
        ''
    End Sub


    Public Shared Function GetDataConnection() As SqlConnection

        Dim XGetDataConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnectionString").ConnectionString)
        Return XGetDataConnection

    End Function

    Public Shared Function GetAllErrors() As DataSet
        Return RetrieveDataSet(DefaultStrSQL)
    End Function



    Public Shared Function GetErrorDate(ByVal ID As Int32) As Date

        Dim ds As DataSet = RetrieveDataSet(DefaultStrSQL & " WHERE Error_ID '" & ID & "'")

        ' save it in a label
        Return ds.Tables(0).Rows(0)("ErrorDate").ToString

    End Function



    Public Shared Function RetrieveDataSet(ByVal strSQL As String) As DataSet
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dbConn As SqlConnection

        dbConn = GetDataConnection()

        ' Connect to the SQL database using a SQL SELECT query to get all 
        ' the data from the "Authors" table.
        da = New SqlDataAdapter(strSQL, dbConn)

        ' Create and fill a DataSet.
        da.Fill(ds)

        RetrieveDataSet = ds
        dbConn.Close()
        dbConn = Nothing
    End Function


    Public Shared Function ExecuteNonQuery(ByVal strSQL As String) As String


        Dim dbConn As SqlConnection
        Dim mySqlCommand As SqlCommand

        dbConn = GetDataConnection()
        dbConn.Open()
        Try
            mySqlCommand = New SqlCommand(strSQL, dbConn)
            ExecuteNonQuery = mySqlCommand.ExecuteNonQuery().ToString()

        Catch MyException As Exception
            ExecuteNonQuery = "EXCEPTION: " & MyException.Message.ToString()
        Finally
            mySqlCommand = Nothing
            dbConn.Close()
            dbConn = Nothing
        End Try


    End Function




    Public Shared Function MembershipUsers(ByVal Username As String, ByVal UserID As String) As DataView

        Dim dt As New DataTable("MembershipTable")


        Dim muc As MembershipUserCollection
        muc = Membership.GetAllUsers()

        dt.Columns.Add("UserID", Type.[GetType]("System.String"))
        dt.Columns.Add("Username", Type.[GetType]("System.String"))
        dt.Columns.Add("Email", Type.[GetType]("System.String"))

        dt.Columns.Add("CreationDate", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("LastLoginDate", Type.[GetType]("System.DateTime"))
        dt.Columns.Add("LastActivityDate", Type.[GetType]("System.DateTime"))

        dt.Columns.Add("IsApproved", Type.[GetType]("System.Boolean"))
        dt.Columns.Add("IsLockedOut", Type.[GetType]("System.Boolean"))
        dt.Columns.Add("IsOnline", Type.[GetType]("System.Boolean"))

        For Each mu As MembershipUser In muc

            Dim dr As DataRow
            dr = dt.NewRow()

            dr("UserID") = mu.ProviderUserKey
            dr("Username") = mu.UserName
            dr("Email") = mu.Email

            dr("CreationDate") = mu.CreationDate
            dr("LastLoginDate") = mu.LastLoginDate
            dr("LastActivityDate") = mu.LastActivityDate

            dr("IsApproved") = mu.IsApproved
            dr("IsLockedOut") = mu.IsLockedOut
            dr("IsOnline") = mu.IsOnline

            dt.Rows.Add(dr)
        Next

        Dim dv As New DataView(dt)


        Dim RowFilter As String = "Username <> 'Bill Gates'"

        If Username <> "0" Then
            RowFilter = RowFilter & " AND Username = '" & Username & "'"
        End If

        If UserID <> "0" Then
            RowFilter = RowFilter & " AND UserID = '" & UserID & "'"
        End If


        RowFilter = RowFilter & ""

        dv.RowFilter = RowFilter

        dv.Sort = "LastName ASC"

        Return dv

    End Function




End Class
