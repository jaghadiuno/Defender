Imports System.Data.SqlClient
Imports System.Globalization
Public Class SiteGeneral
    Private Shared xRef As String
    Private Shared xRefID As String
    Private Shared strSQL, strSQLUpdate, strSQLInsert As String
    Private Shared strConn As New SqlConnection(ConfigurationManager.ConnectionStrings("ZenoConnectionString").ConnectionString)
    Public Shared Function GetSiteName() As String
        Return ConfigurationManager.AppSettings.Get("WebsiteName").ToString
    End Function
    Public Shared Function GetTitleCase(Optional ByVal str As String = Nothing) As String
        If Not IsNothing(str.ToString) AndAlso Not String.IsNullOrEmpty(str.ToString) Then
            ' str = HttpContext.Current.Server.HtmlDecode(str)
            Return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower).ToString()
        Else
            Return ""
        End If
    End Function
    Public Shared Function GetDisplayName() As String
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            Return HttpContext.Current.User.Identity.Name
        Else
            Return "Welcome"
        End If
    End Function
    Public Shared Function strJoinSpaces(ByVal str As String) As String
        If str <> "" Then
            'str = str.Trim
            'str = str.ToLower
            'str = str.Replace("  ", " ")
            'str = str.Replace(" ", "-")
            'str = str.Trim
            str = HttpContext.Current.Server.HtmlDecode(str)
            str = strStrip(str)
        End If
        Return str
    End Function
    Public Shared Function strStrip(ByVal str As String) As String
        If str <> "" Then
            str = HttpContext.Current.Server.HtmlDecode(str)
            str = Regex.Replace(str, "<(.|\n)+?>", String.Empty)
            str = str.Trim
            str = str.ToLower
            str = str.Replace("/", "-")
            str = str.Replace("_", "-")
            str = str.Replace("'", "")
            str = str.Replace("''", "")
            str = str.Replace("""", "")
            str = str.Replace(",", "")
            str = str.Replace("'", "")
            str = str.Replace(";", "")
            str = str.Replace(":", "")
            str = str.Replace("~", "")
            str = str.Replace("(", "")
            str = str.Replace(")", "")
            str = str.Replace("!", "")
            str = str.Replace("@", "")
            str = str.Replace("#", "")
            str = str.Replace("$", "")
            str = str.Replace("%", "")
            str = str.Replace("^", "")
            str = str.Replace("*", "")
            str = str.Replace("?", "")
            str = str.Replace("~", "")
            str = str.Replace("`", "")
            str = str.Replace("!", "")
            str = Regex.Replace(str, "[\/?:*""><|]+", "")
            str = Regex.Replace(str, "[\[\]\\\^\$\.\|\?\*\+\(\)\{\}%;><!@#&\+/]", "")
            str = str.Trim
            str = str.Replace("  ", " ")
            str = str.Replace(" ", "-")
            str = str.Trim
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Trim
        End If
        Return str
    End Function
    Public Shared Function strCleanup(ByVal str As String) As String
        If str <> "" Then
            str = HttpContext.Current.Server.HtmlDecode(str)
            str = Regex.Replace(str, "<(.|\n)+?>", String.Empty)
            str = str.Trim
            str = str.ToLower
            str = str.Replace("'", "")
            str = str.Replace("''", "")
            str = str.Replace("""", "")
            str = str.Replace(",", "")
            str = str.Replace("'", "")
            str = str.Replace(";", "")
            str = str.Replace(":", "")
            str = str.Replace("~", "")
            str = str.Replace("(", "")
            str = str.Replace(")", "")
            str = str.Replace("!", "")
            str = str.Replace("@", "")
            str = str.Replace("#", "")
            str = str.Replace("$", "")
            str = str.Replace("%", "")
            str = str.Replace("^", "")
            str = str.Replace("*", "")
            str = str.Replace("?", "")
            str = str.Replace("~", "")
            str = str.Replace("`", "")
            str = str.Replace("!", "")
            str = Regex.Replace(str, "[\/?:*""><|]+", "")
            str = Regex.Replace(str, "[\[\]\\\^\$\.\|\?\*\+\(\)\{\}%;><!@#&\+/]", "")
            str = str.Trim
            str = str.Replace("  ", " ")
            str = str.Replace("  ", " ")
            str = str.Replace("  ", " ")
            str = str.Replace("  ", " ")
            str = str.Trim
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Replace("--", "-")
            str = str.Trim
        End If
        Return str
    End Function
    Public Shared Function strRemoveSpaces(ByVal str As String) As String
        Dim options As RegexOptions = RegexOptions.None
        Dim regex As New Regex("[ ]{2,}", options)
        str = regex.Replace(str, " ")
        str = str.Trim
        Return str
    End Function
    Public Shared Function strSanitize(ByVal str As String) As String
        Return str
    End Function
    Public Shared Function strTextOnly(ByVal str As String) As String
        If str <> "" Then
            str = str.Trim
            str = str.ToLower
            'str = Regex.Replace(str, "[\/?:*""><|]+", "")
            str = Regex.Replace(str, "<(.|\n)+?>", String.Empty)
            'str = Regex.Replace(str, "[\[\]\\\^\$\.\|\?\*\+\(\)\{\}%;><!@#&\+/]", "")
            str = str.Trim
            str = str.Replace("  ", " ")
            str = str.Trim
        End If
        Return str
    End Function
    Public Shared Function strFormatText(ByVal str As String) As String
        If str <> "" Then
            'str = str.Trim
            str = Replace(str, Environment.NewLine, "<br />")
            'str = Replace(str, "[", "<")
            'str = Replace(str, "]", ">")
            'str = Replace(str, "[B]", "<strong>")
            'str = Replace(str, "[/B]", "</strong>")
            'str = Replace(str, "[font", "<font face")
            'str = Replace(str, "[color", "<font color")
            'str = Replace(str, "[/font]", "</font>")
            'str = Replace(str, "[/color]", "</font>")
            'str = Replace(str, "[", "<")
            'str = Replace(str, "]", ">")
        End If
        Return str
    End Function
End Class