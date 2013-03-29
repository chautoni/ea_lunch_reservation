module ReservationsHelper
  def dishes_selection_input(type, builder)
    builder.input("#{type}_ids", label_method: :name, value_method: :id, collection: Food.order('name'), label: type.to_s.pluralize.humanize, input_html: { multiple: true, class: 'chzn-select span6' })
  end
end
