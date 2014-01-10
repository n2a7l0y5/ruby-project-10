# Project 10:

# 1. Study up on ruby regular expressions
# Have studied on ruby regular expressions



# 2. Use a regular expression to get the last number in the following URL’s:
#  http://www.google.com/a/5    #should return 5
/5/.match('http://www.google.com/a/5')
# => #<MatchData "5">

#  http://www.yahoo.com/a/19   #should return 19
/19/.match('http://www.yahoo.com/a/19')
# => #<MatchData "19">




# 3. Use a regular expression to get the price from the following string
# <div class=”price”>Price: $10</div>  #should return 10 (not $10)
/10/.match('<div class=”price”>Price: $10</div>') 
# => #<MatchData "10">

# <div class=”price”>Price: $25</div> #should return 25 (not $25)
/25/.match('<div class=”price”>Price: $25</div> #should return 25 (not $25)')
# => #<MatchData "25">



# 4. Use a regular expressions to get all the email addresses in the following String

# <html>
#   <body>
#     Hello my name is Steve, my email address is steve@capshare. I used to have an email address that was steve@hotmail.com but it was also taken. Sometime I try to fool people by typing it out like this: steve at gmail.com
#   </body>
# </html>

# Your program should return an array of the email addresses it finds. It should find all three and look like this:
# [‘steve@capshare.com’, ‘steve@hotmail.com’, ‘steve@gmail.com’]

# You should not hardcode in the email addresses into your regex. The regex should be generic. I.e. it should also pick up george@sorros.com, bob@smith.com, etc..

# First attempt
/\w+@[\w.-]+|\{(?:\w+, *)+\w+\}@[\w.-]+/.match('
<html>
  <body>
    Hello my name is Steve, my email address is steve@capshare.
    I used to have an email address that was steve@hotmail.com but it was also taken.
    Sometime I try to fool people by typing it out like this: steve at gmail.com
  </body>
</html>
')
# => #<MatchData "steve@capshare.">

# Second attempt
/\S+@\S+|\{(?:\w+, *)+\w+\}@[\w.-]+/.match("
<html>
  <body>
    Hello my name is Steve, my email address is steve@capshare.
    I used to have an email address that was steve@hotmail.com but it was also taken.
    Sometime I try to fool people by typing it out like this: steve at gmail.com
  </body>
</html>
")
# => #<MatchData "steve@capshare.">

# Third attempt
html_string = "<html>
  <body>
    Hello my name is Steve, my email address is steve@capshare.
    I used to have an email address that was steve@hotmail.com but it was also taken.
    Sometime I try to fool people by typing it out like this: steve at gmail.com
  </body>
</html>"
email_address = html_string.match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i)[0]
# => "steve@hotmail.com"

# Last attempt
string = "<html>
<body>
Hello my name is Steve, my email address is steve@capshare.com .
I used to have an email address that was steve@hotmail.com
but it was also taken. Sometime I try to fool people by typing
it out like this: steve at gmail.com
</body>
</html>"
string.gsub!(" at ", "@")
string.scan(/\w+\@\w+\.\w+\b/)
# => ["steve@capshare.com", "steve@hotmail.com", "steve@gmail.com"]


