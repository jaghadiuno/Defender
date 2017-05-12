Public Class DefaultSidebar
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub Controls_UIs_Cases_ParticipantCases_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsNothing(Request.QueryString("participantguid")) AndAlso Request.QueryString("participantguid") <> "" Then

            phParticipantInfoShow.Visible = True

            hdnParticipantName.Value = CPCSParticipants.getParticipantName(New Guid(Request.QueryString("participantguid")))

            ltrlAttorneyName.Text = hdnParticipantName.Value

            Me.Parent.Page.Title = "Participant: " & hdnParticipantName.Value & "'s Cases"



            setParameters()

            gridCPCSCaseSearch.Visible = True
            gridCPCSCaseSearch.Enabled = True

            gridCPCSCaseSearch.DataBind()


        Else
            phParticipantInfoShow.Visible = False
            gridCPCSCaseSearch.Visible = False
            gridCPCSCaseSearch.Enabled = False

        End If

    End Sub




    Private Sub Controls_UIs_Cases_ParticipantCases_Load(sender As Object, e As EventArgs) Handles Me.Load





            gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-participant-cases-" & Now()


            If Not Page.IsPostBack AndAlso Not IsNothing(Request.QueryString("participantguid")) Then

                lkDisplayInfo.Visible = True
                phParticipantInfoShow.Visible = True


            End If


        End Sub



        Sub setParameters()

            dsSearchResults.SelectParameters.Clear()

            dsSearchResults.SelectParameters.Add("personGUID", Request.QueryString("participantguid"))
            dsSearchResults.SelectParameters.Add("personType", "Participant")


        End Sub

        Private Sub lkDisplayInfo_Click(sender As Object, e As EventArgs) Handles lkDisplayInfo.Click

            lvParticipantDetails.Visible = True
            lvParticipantDetails.Enabled = True


            lkDisplayInfo.Visible = False


            phParticipantInfoShow.Visible = False

        End Sub



    End Class
