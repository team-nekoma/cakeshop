class OrderDatail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    enum production_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }

    def self.order_detail_statuses_i18n
        order_detail_statuses.keys.map do |status|
          [I18n.t("enums.order.order_detail_status.#{status}"), status]
        end.to_h
    end
end
