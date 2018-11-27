Imports Telerik.Web.UI

Public Class AttorneysList
    Inherits System.Web.UI.Page






    Private Sub Attorney_Search(sender As Object, e As SearchBoxEventArgs) Handles AttorneySearchBox.Search

        Dim AttorneyID As Int32 = 0

        If e.DataItem IsNot Nothing Then

            AttorneyID = DirectCast(e.DataItem, Dictionary(Of String, Object))("AttorneyID")
            hdnAttorneyID.Value = AttorneyID

        End If


        'If Not String.IsNullOrWhiteSpace(AttorneyID.ToString + AttorneySearchBox.Text) Then
        '    gridAttorneys.Rebind()
        'End If


        'odsAttorneys.DataBind()
        gridAttorneys.DataBind()

        'gridAttorneys.Rebind()

        'Label1.Text = AttorneyID.ToString + AttorneySearchBox.Text


    End Sub


    'Protected Sub AttorneySearchBox_Search(sender As Object, e As SearchBoxEventArgs)


    '    'Dim searchBox As RadSearchBox = DirectCast(sender, RadSearchBox)

    '    'Dim AttorneyID As String = String.Empty
    '    'Dim likeCondition As String

    '    'If e.DataItem IsNot Nothing Then

    '    '    AttorneyID = DirectCast(e.DataItem, Dictionary(Of String, Object))("AttorneyID").ToString()


    '    '    If Not String.IsNullOrEmpty(AttorneyID) Then

    '    '        likeCondition = String.Format("'{0}{1}%'", If(searchBox.Filter = SearchBoxFilter.Contains, "%", ""), DirectCast(e.DataItem, Dictionary(Of String, Object))("AttorneyID").ToString())



    '    '        'gridAttorneys.SelectCommand = Convert.ToString("SELECT TOP 10 [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice]" + "FROM[Products] WHERE [" + searchBox.DataValueField + "] LIKE ") & likeCondition


    '    '        'gridAttorneys.DataBind()


    '    '        Label1.Text = likeCondition



    '    '    End If
    '    'End If



    'End Sub

    Protected Sub Page_Load(sender As Object, args As EventArgs) Handles Me.Load
        ' A parameter for the Charts' data source is set in the ItemDataBound event of the RadGrid
        ' and a postback from the skin chooser does not rebind the grid, so the charts will not have any data
        For Each item As GridDataItem In gridAttorneys.MasterTableView.Items
            Dim chart As RadHtmlChart = TryCast(item("ChartColumn").FindControl("chartArea"), RadHtmlChart)
            SqlDataSource2.SelectParameters(0).DefaultValue = item.GetDataKeyValue("AttorneyGUID").ToString()
            SqlDataSource2.SelectParameters(1).DefaultValue = Now.Date.AddYears(-10)
            SqlDataSource2.SelectParameters(2).DefaultValue = Now.Date
            chart.DataSource = SqlDataSource2.[Select](DataSourceSelectArguments.Empty)
            chart.DataBind()
        Next

    End Sub

    Protected Sub gridAttorneys_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles gridAttorneys.ItemDataBound
        If e.Item.ItemType = GridItemType.Item OrElse e.Item.ItemType = GridItemType.AlternatingItem Then
            Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
            Dim chart As RadHtmlChart = TryCast(item("ChartColumn").FindControl("chartArea"), RadHtmlChart)
            SqlDataSource2.SelectParameters(0).DefaultValue = item.GetDataKeyValue("AttorneyGUID").ToString()
            SqlDataSource2.SelectParameters(1).DefaultValue = Now.Date.AddYears(-10)
            SqlDataSource2.SelectParameters(2).DefaultValue = Now.Date
            chart.DataSource = SqlDataSource2.[Select](DataSourceSelectArguments.Empty)
            If (TryCast(chart.DataSource, DataView)).Count > 0 Then
                chart.DataBind()
            Else
                chart.Visible = False
                item("ChartColumn").Controls.Add(New LiteralControl("This attorney has had no assignments in the last 10 years."))
            End If
        End If
    End Sub

End Class