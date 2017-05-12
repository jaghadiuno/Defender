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


End Class