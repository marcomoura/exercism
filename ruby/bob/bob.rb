class Bob

  def initialize
    @responses = {nothing: 'Fine. Be that way!',
                  yell:     'Woah, chill out!',
                  question:  'Sure.',
                  anything: 'Whatever.'}
  end

  def hey message
    answer message
  end

  private

  def answer message
    clean message

    @responses.select do |response, answer|
      send response, message
    end.values.first
  end

  def anything m; true end

  def question message
    message.end_with? '?'
  end

  def yell message
    message.match /^[^a-z]*$/
  end

  def nothing message
    message.empty?
  end

  def clean message
    message.strip!
  end
end
