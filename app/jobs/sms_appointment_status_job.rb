class SmsAppointmentStatusJob < ApplicationJob
  queue_as :default

  def perform(appointment)
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: appointment.user.phone,
      body: "Your appointment for #{appointment.pet.name} on #{appointment.appointment_date} at #{appointment.time.strftime("%H:%M")} has been #{appointment.status}"
    })
  end
end
