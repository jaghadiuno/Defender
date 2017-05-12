Public Class AttorneyCases
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub





    Private Sub Controls_UIs_Cases_AttorneyCases_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

            If Not IsNothing(Request.QueryString("attorneyguid")) AndAlso Request.QueryString("attorneyguid") <> "" Then

                phAttorneyInfoShow.Visible = True

                hdnAttorneyName.Value = CPCSAttorneys.getAttorneyName(New Guid(Request.QueryString("attorneyguid")))


                ltrlAttorneyName.Text = hdnAttorneyName.Value

                Me.Parent.Page.Title = "Attorney: " & hdnAttorneyName.Value & "'s Cases"



                setParameters()

                gridCPCSCaseSearch.Visible = True
                gridCPCSCaseSearch.Enabled = True

                gridCPCSCaseSearch.DataBind()


            Else

                phAttorneyInfoShow.Visible = False

                gridCPCSCaseSearch.Visible = False
                gridCPCSCaseSearch.Enabled = False

            End If

        End Sub




        Private Sub Controls_UIs_Cases_AttorneyCases_Load(sender As Object, e As EventArgs) Handles Me.Load





            gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-attorney-cases-" & Now()


            If Not Page.IsPostBack AndAlso Not IsNothing(Request.QueryString("attorneyguid")) Then

                lkDisplayInfo.Visible = True
                phAttorneyInfoShow.Visible = True


            End If


        End Sub



        Sub setParameters()

            dsSearchResults.SelectParameters.Clear()

            dsSearchResults.SelectParameters.Add("personGUID", Request.QueryString("attorneyguid"))
            dsSearchResults.SelectParameters.Add("personType", "Attorney")


        End Sub

        Private Sub lkDisplayInfo_Click(sender As Object, e As EventArgs) Handles lkDisplayInfo.Click

            lvAttorneyDetails.Visible = True
            lvAttorneyDetails.Enabled = True


            lkDisplayInfo.Visible = False


            phAttorneyInfoShow.Visible = False

        End Sub




    End Class
