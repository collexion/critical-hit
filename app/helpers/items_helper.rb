module ItemsHelper
  def check_in_out_link_helper(item)
    if item.checkedin?
      link_to 'Check Out', check_out_item_path(item), class: 'btn btn-small',
                method: :put
    elsif item.checkedout?
      link_to 'Check In', check_in_item_path(item), class: 'btn btn-small',
                method: :put
    else
      "ack! unknown item status"
    end
  end
end
