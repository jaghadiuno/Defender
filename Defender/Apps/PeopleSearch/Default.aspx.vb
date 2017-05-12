Imports Defender.SiteGeneral
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar




Public Class _Default5

    Inherits System.Web.UI.Page

    Dim maxPeopleAge As Integer = -18
    Dim minPeopleAge As Integer = -100




    Private Sub Apps_Reports_Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-case-search-" & Now()

        If Not Page.IsPostBack Then
            txtPersonName.Focus()
            gridCPCSCaseSearch.Visible = False
        End If

        ' Me.Form.DefaultButton = btnSubmit.ID
        ' Me.Focus(txtPersonName.ID)


        rfvBirthdate.ValueToCompare = Now.Date.AddYears(maxPeopleAge)
        dteBirthdate.FocusedDate = Now.Date.AddYears(maxPeopleAge)

        dteBirthdate.MinDate = Now.Date.AddYears(minPeopleAge)
        dteBirthdate.MaxDate = Now.Date.AddYears(maxPeopleAge)

        dteBirthdate.DateInput.MaxDate = Now.Date.AddYears(maxPeopleAge)
        dteBirthdate.DateInput.MinDate = Now.Date.AddYears(minPeopleAge)

        dteBirthdate.DateInput.ShortYearCenturyEnd = Now.Date.AddYears(maxPeopleAge).Year

        dteBirthdate.Calendar.FocusedDate = Now.Date.AddYears(maxPeopleAge)

        dteBirthdate.Calendar.RangeMaxDate = Now.Date.AddYears(maxPeopleAge)
        dteBirthdate.Calendar.RangeMinDate = Now.Date.AddYears(minPeopleAge)

        dteBirthdate.Calendar.RangeSelectionStartDate = Now.Date.AddYears(minPeopleAge)
        dteBirthdate.Calendar.RangeSelectionEndDate = Now.Date.AddYears(maxPeopleAge)



        'dteBirthdate.Calendar.ShowColumnHeaders = True
        'dteBirthdate.Calendar.ShowOtherMonthsDays = True
        'dteBirthdate.Calendar.ShowRowHeaders = False
        'dteBirthdate.PopupDirection = DatePickerPopupDirection.BottomLeft




        'txtPersonName.Text
        'dteBirthdate.SelectedDate
        'txtPhone.Text

        'txtAddress.Text
        'txtCity.Text
        'ddlState.SelectedValue
        'txtZipCode.Text



    End Sub



    Private Sub txtPersonName_Search(sender As Object, e As SearchBoxEventArgs) Handles txtPersonName.Search


        ' errLabel.Text = txtPersonName.Text
        processSearch()


    End Sub
    Private Sub txtPersonName_DataSourceSelect(sender As Object, e As SearchBoxDataSourceSelectEventArgs) Handles txtPersonName.DataSourceSelect



        'Dim source As SqlDataSource = DirectCast(e.DataSource, SqlDataSource)
        'Dim searchBox As RadSearchBox = DirectCast(sender, RadSearchBox)

        'Dim likeCondition As String = String.Format("'{0}' + @filterString + '%'", If(searchBox.Filter = SearchBoxFilter.Contains, "%", ""))

        'Dim countCondition As String = If(e.ShowAllResults, " ", " TOP 1000 ")

        'source.SelectCommand = String.Format("SELECT {0}* FROM [Products] WHERE [" + searchBox.DataTextField + "] LIKE {1}", countCondition, likeCondition)

        'source.SelectParameters.Add("filterString", e.FilterString.Replace("%", "[%]").Replace("_", "[_]"))

        'odsParticipants.DataBind() 


    End Sub

    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        processSearch()
    End Sub

    Sub processSearch()


        If Not String.IsNullOrWhiteSpace(txtPersonName.Text.ToString.Trim) Then

            gridCPCSCaseSearch.Visible = True

            setParameters()
            'gridCPCSCaseSearch.DataSource = dsSearchResults
            gridCPCSCaseSearch.Rebind()

            lblSearchItem.Text = "Search Result For '<span class=text-success bold>" & txtPersonName.Text.ToString.Trim & "</span>'"



            'gridCPCSCaseSearch.Focus()
            lblSearchItem.Focus()



        Else

            gridCPCSCaseSearch.Visible = False


        End If

    End Sub





    Private Sub lbAdvancedSearch_Click(sender As Object, e As EventArgs) Handles lbAdvancedSearch.Click

        If SearchPanel.Visible = True Then

            ClearControls()
            txtPersonName.ShowSearchButton = "True"
            SearchPanel.Visible = False
            lbAdvancedSearch.Text = "Advanced Search  <span class='caret'></span>"
            lbAdvancedSearch.CssClass = "text-info bold"
            lbAdvancedSearch.Attributes.Remove("onclick")

        Else

            lbAdvancedSearch.Attributes.Add("onclick", "return confirm('Are you sure? All entries you have entered will be lost.');")
            txtPersonName.ShowSearchButton = "False"
            SearchPanel.Visible = True
            lbAdvancedSearch.Text = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>  Close Advanced"
            lbAdvancedSearch.CssClass = "text-danger bold"
        End If

    End Sub


    Private Sub dteBirthdate_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles dteBirthdate.SelectedDateChanged

        If IsDate(dteBirthdate.SelectedDate) Then

            panelFlexibility.Visible = True
        Else

            panelFlexibility.Visible = False

        End If


    End Sub


    'Private Sub gridCPCSCaseSearch_SelectedIndexChanged(sender As Object, e As GridColumnCreatingEventArgs) Handles gridCPCSCaseSearch.SelectedIndexChanged



    '    If (gridCPCSCaseSearch.SelectedItems.Count > 0) Then



    '        Response.Redirect("/apps/casemanagement/managementcasedetails.aspx?caseguid=" & gridCPCSCaseSearch.SelectedItems..Keys("CaseGUID").ToString())


    '    End If


    'End Sub




    Sub setParameters()

        dsSearchResults.SelectParameters.Clear()


        dsSearchResults.SelectParameters.Add("personName", txtPersonName.Text)

        dsSearchResults.SelectParameters.Add("searchType", blSearchType.SelectedValue)


        If IsDate(dteBirthdate.SelectedDate) Then
            dsSearchResults.SelectParameters.Add("DOB", dteBirthdate.SelectedDate)
            dsSearchResults.SelectParameters.Add("dobRange", ddlFlexible.SelectedValue)
        Else
            dsSearchResults.SelectParameters.Add("DOB", "")
            dsSearchResults.SelectParameters.Add("dobRange", 0)
        End If

        dsSearchResults.SelectParameters.Add("phoneNumber", txtPhone.Text)

        dsSearchResults.SelectParameters.Add("streetAddress", txtAddress.Text)

        dsSearchResults.SelectParameters.Add("city", txtCity.Text)

        dsSearchResults.SelectParameters.Add("state", ddlState.SelectedValue)

        dsSearchResults.SelectParameters.Add("zipCode", txtZipCode.Text)

        dsSearchResults.SelectParameters.Add("staffName", txtStaffName.Text)
        dsSearchResults.SelectParameters.Add("caseNumber", txtCaseNumber.Text)



        Dim xlist As New List(Of String)


        For Each xitem As ListItem In ddlRole.Items
            If xitem.Selected Then
                xlist.Add(xitem.Text)
            End If
        Next


        dsSearchResults.SelectParameters.Add("participantRoles", String.Join(",", xlist.ToArray))

        'errLabel.Text = String.Join(",", xlist.ToArray)



        'Dim strParRoles As String = participantRoles
        'Dim listParRoles As String() = strParRoles.Split(",")
        'For Each s As String In listParRoles
        '    s.ToString()
        'Next



    End Sub


    Sub ClearControls()



        blSearchType.Items.Item(0).Selected = True
        'blSearchType.Items.Item(1).Selected = False

        dteBirthdate.SelectedDate = Nothing
        ddlFlexible.SelectedValue = Nothing

        txtPhone.Text = ""
        txtAddress.Text = ""

        txtCity.Text = ""

        ddlState.ClearSelection()

        txtZipCode.Text = ""

        'txtStaffName.Text = Nothing

        txtCaseNumber.Text = ""

        ddlRole.ClearSelection()



    End Sub




End Class
