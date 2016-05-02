# Description:
#   Automatically post jira links when issue numbers are seen
#
# Commands:
#
# Configuration:
#   none

jira_host = "https://yourjira.com"
zendesk_host = "https://your.zendesk.com"

project = [
  'AC',
  'AN',
  'AS',
  'ASB',
  'AUTO',
  'CL',
  'CM',
  'CR',
  'DOC',
  'EA',
  'ES',
  'HD',
  'IT',
  'JIRA',
  'KB',
  'ML',
  'MON',
  'NBC',
  'NN',
  'OP',
  'OPE',
  'RA',
  'RG',
  'SI',
  'SL',
  'SYS',
  'TAC',
  'TT',
  'UX'
]

module.exports = (robot) ->

  robot.hear /(^|\s)(AC|AN\AS\ASB|AUTO|CL|CM|CR|DOC|EA|ES|HD|IT|JIRA|KB|ML|MON|NBC|NN|OP|OPE|RA|RG|SI|SL|SYS|TAC|TT|UX)-(\d+)(\s|$)/i, (msg) ->
    project = msg.match[2].toUpperCase()
    id = msg.match[3]
    issue = project + '-' + id
    url = jira_host + "/browse/" + issue
    msg.send url

  robot.hear /z(\d+)/i, (msg) ->
    id = msg.match[1]
    url = zendesk_host + "/tickets/" + id
    msg.send url
