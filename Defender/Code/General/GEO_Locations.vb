Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class CPCSLocations


    Shared strConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)



    Public Shared Function getStates() As DataView

        Dim dt As New DataTable("StateTable")


        Dim StateID As DataColumn = New DataColumn
        StateID.DataType = System.Type.GetType("System.Int32")
        StateID.AllowDBNull = False
        StateID.Caption = "StateID"
        StateID.ColumnName = "StateID"
        'StateID.DefaultValue = 0
        StateID.AutoIncrement = True
        StateID.AutoIncrementSeed = 1
        StateID.AutoIncrementStep = 1

        dt.Columns.Add(StateID)


        dt.Columns.Add("StateCode", Type.[GetType]("System.String"))
        dt.Columns.Add("StateName", Type.[GetType]("System.String"))

        Dim dr As DataRow



        Dim commandStr As String = "SELECT DISTINCT StateCode, StateName FROM State ORDER BY StateName ASC;"


        Dim command As SqlCommand = New SqlCommand(
              commandStr, strConn)

        If strConn.State = ConnectionState.Closed Then strConn.Open()

        Dim reader As SqlDataReader = command.ExecuteReader()

        If reader.HasRows Then

            Do While reader.Read()

                dr = dt.NewRow()
                dr("StateName") = reader("StateName")
                dr("StateCode") = reader("StateCode")

                dt.Rows.Add(dr)

            Loop

        End If



        If strConn.State = ConnectionState.Open Then strConn.Close()


        Dim dv As New DataView(dt)


        ' Dim RowFilter As String = "StateCode <> ''"
        'RowFilter = RowFilter & ""
        'dv.RowFilter = RowFilter

        'dv.Sort = "StateName ASC"

        Return dv

    End Function





End Class
