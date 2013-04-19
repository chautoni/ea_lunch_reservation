module ReservationsHelper
  def dishes_selection_input(type, builder)
    builder.input("#{type}_ids", label_method: :name, value_method: :id, collection: @foods, label: type.to_s.pluralize.humanize, input_html: { multiple: true, class: 'chzn-select span6' })
  end

  def user_selection_input(builder, reservation)
    builder.input(:user_id, label_method: :name, value_method: :id, collection: @users, label: 'User', prompt: 'Select user', selected: session[:last_user] || reservation.user_id, input_html: { class: 'chzn-select span3' })
  end
end
