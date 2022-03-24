# frozen_string_literal: true
Dir['model/*.rb'].each {|file| require file }

desc 'generate feedback xml file'
task user_feedback: :environment do
  xml = Builder::XmlMarkup.new(:target => $stdout, :indent => 1)

  Feedback.each_With_index do |feedback, index|
    xml.comment! feedback.id
    xml.feedback feedback.comment
    xml.rating feedback.post.average_rating if feedback.comment.blank? && feedback.source_type == 'post'
  end

end
