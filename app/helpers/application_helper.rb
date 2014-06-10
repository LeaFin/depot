module ApplicationHelper
    def number_to_chf(price)
        return sprintf("%0.02f CHF", price)
    end
    def hidden_div_if(condition, attributes = {}, &block)
        if condition
            attributes["style"] = "display: none"
        end
        content_tag("div", attributes, &block)
    end
end


