Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class DBConnections



    Public Shared ReadOnly Property strGetZENOConn() As SqlConnection
        Get
            Return New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
        End Get
    End Property





End Class
