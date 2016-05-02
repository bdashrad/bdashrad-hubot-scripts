# Description:
#   Manage alerts with Hubot.
#
# Commands:
#   hubot alerts take
#   hubot alerts who
#
# Configuration:
#   none

module.exports = (robot) ->

  robot.respond /alerts (.*)/i, (msg) ->
    alerts = robot.brain.get('alerts') or 'no one'
    username = msg.message.user.name.toLowerCase()
    method = msg.match[1]
    if method is "take"
      msg.send alerts + ' was on alerts, now ' + username + ' is on alerts.'
      robot.brain.set 'alerts', username
    else if method is "taketh"
      msg.send "Forsooth! " + alerts + " was the alertee, but " + username + " taketh alerts henceforth!  May thy crits be not.."
      msg.send "/me bows"
      robot.brain.set 'alerts', username
    else if method is "takizzle"
      msg.send "Sup " + alerts + " dawg, looks like home slice " + username + "'s pickin' up yo 'lerts, woooord homes."
      robot.brain.set 'alerts', username
    else if /whom?|0/.test(method)
      alerts = robot.brain.get('alerts') or 'no one' 
      msg.send alerts + ' is on alerts.'
    else
      msg.reply "Usage: alerts < who | take >"

  # robot.respond /alerts (take|taketh|takizzle).*/i, (msg) ->
  #   # check who is currently on alerts
  #   alerts = robot.brain.get('alerts') or 'no one'

  #   # get who sent message and from what room
  #   from = msg.message.user.name.toLowerCase()
  #   roomm = msg.message.room

  #   [dummy, method] = msg.match

  #   # sanitize the input
  #   method = method?.trim().toLowerCase()

  #   # determine method and response
  #   if method?
  #     switch method
  #       when "take"
  #         message = alerts + ' was on alerts, now ' + username + ' is on alerts.'
  #         answer message
  #       when "taketh"
  #         message = "Forsooth! " + alerts + " was the alertee, but " + username + " taketh alerts henceforth!  May thy     crits be not.."
  #         answer message
  #       when "takizzle"
  #         message = "Sup " + alerts + " dawg, looks like home slice " + username + "'s pickin' up yo 'lerts, woooord ho    mes."
  #         answer message
  #       else msg.send "Usage: alerts < who | take >"

  #     answer = (message) ->
  #       robot.brain.set 'alerts', username
  #       msg.send message

  # robot.respond /alerts whom?/i, (msg) ->
