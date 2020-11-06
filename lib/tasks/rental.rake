namespace :rental do

  desc "貸出期限3日が過ぎた本を返却する"
  task :return_for_three_days => :environment do
    User.return_book_for_three_days
  end

end