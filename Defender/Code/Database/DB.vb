Imports System.Data.SqlClient
Imports System.Data
Imports Microsoft.VisualBasic

Public Class DB
    Public Shared DA As New SqlDataAdapter
    Public Shared Function GetDataConnection() As SqlConnection

        GetDataConnection = DBConnections.strGetZENOConn()
        'GetDataConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)

    End Function

    Public Shared Function RetrieveDataSet(ByVal strSQL As String) As DataSet
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim dbConn As SqlConnection

        dbConn = GetDataConnection()

        'you can pass in any sql statement you want and have it filled in the dataset that is returned.
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

End Class
