Imports Defender.SiteGeneral
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar




Public Class _AdvancedSearch

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




    Private Sub txtPersonName_TextChanged(sender As Object, e As EventArgs) Handles txtPersonName.TextChanged

        processSearch()

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
            gridCPCSCaseSearch.Focus()

        Else

            gridCPCSCaseSearch.Visible = False


        End If

    End Sub










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

        'dsSearchResults.SelectParameters.Add("caseType", ddlCaseType.SelectedValue)


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



End Class
