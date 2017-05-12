Public Class ClientCases
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub Controls_UIs_Cases_ClientCases_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

            If Not IsNothing(Request.QueryString("clientguid")) AndAlso Request.QueryString("clientguid") <> "" Then

                phClientInfoShow.Visible = True

                hdnClientName.Value = CPCSClients.getClientName(New Guid(Request.QueryString("clientguid")))

                ltrlAttorneyName.Text = hdnClientName.Value

                Me.Parent.Page.Title = "Client: " & hdnClientName.Value & "'s Cases"



                setParameters()

                gridCPCSCaseSearch.Visible = True
                gridCPCSCaseSearch.Enabled = True

                gridCPCSCaseSearch.DataBind()


            Else

                phClientInfoShow.Visible = False
                gridCPCSCaseSearch.Visible = False
                gridCPCSCaseSearch.Enabled = False

            End If

        End Sub




        Private Sub Controls_UIs_Cases_ClientCases_Load(sender As Object, e As EventArgs) Handles Me.Load





            gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-client-cases-" & Now()


            If Not Page.IsPostBack AndAlso Not IsNothing(Request.QueryString("clientguid")) Then

                lkDisplayInfo.Visible = True
                phClientInfoShow.Visible = True


            End If


        End Sub



        Sub setParameters()

            dsSearchResults.SelectParameters.Clear()

            dsSearchResults.SelectParameters.Add("personGUID", Request.QueryString("clientguid"))
            dsSearchResults.SelectParameters.Add("personType", "Client")


        End Sub

        Private Sub lkDisplayInfo_Click(sender As Object, e As EventArgs) Handles lkDisplayInfo.Click

            lvClientDetails.Visible = True
            lvClientDetails.Enabled = True


            lkDisplayInfo.Visible = False


            phClientInfoShow.Visible = False

        End Sub



    End Class
