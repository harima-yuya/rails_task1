class Post < ApplicationRecord
    validates :title,presence: {message: "タイトルは必須項目です"}
    validates :start_date,presence: {message: "開始日は必須項目です"}
    validates :end_date,presence: {message: "終了日は必須項目です"}
    validates :start_date,format:{ with: /\A[0-9]{4}-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])/,message: "開始日には日付を入力して下さい"}
    validates :end_date,format:{ with: /\A[0-9]{4}-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])/,message: "終了日には日付を入力して下さい"}
    validate :start_end_check

    def start_end_check
        if end_date < start_date
            errors.add(:end_date,"終了日は開始日より後にして下さい")
        end   
    end
end
