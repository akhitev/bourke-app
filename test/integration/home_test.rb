require 'test_helper'

#TODO
#describe 'home page' do
#
#  visit root_path
#
#  page.should have_field('comment_subject')
#  page.should have_field('comment_body')
#  page.should have_field('comment_attachment')
#  page.should have_field('comment_other_attachment')
#
#  comment_subject = 'Newby'
#  comment_body = 'Woot, a file!'
#  fill_in 'comment_subject', with: comment_subject
#  fill_in 'comment_body', with: comment_body
#
#  # Attach file
#  file_path = File.join(Rails.root, 'spec/fixtures/qr.jpg')
#  other_file_path = File.join(Rails.root, 'spec/fixtures/hi.txt')
#  attach_file 'comment_attachment', file_path
#  attach_file 'comment_other_attachment', other_file_path
#
#  page_should_not_redirect do
#    click_button 'Create Comment'
#  end
#
#  within '#comments' do
#    page.should have_content(comment_subject)
#    page.should have_content(comment_body)
#    page.should have_content(File.basename(file_path))
#    page.should have_content(File.basename(other_file_path))
#  end
#end

