range = 1..Float::INFINITY
guests = Guest.where.not(email: [nil, '']).where(id: range)
guests.each do |guest|
  GuestMailer.postponed_email(guest).deliver_later
end
