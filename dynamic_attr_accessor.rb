class Test
    def self.set_case_method(n: 1)
        case_name = "case_#{n}"
        define_method("#{case_name}=".to_sym) do |val|
            instance_variable_set("@" + case_name, val)
        end

        define_method(case_name.to_sym) do
            instance_variable_get("@" + case_name)
        end

        define_method(:"set_#{case_name}") do |val|
            public_send("#{case_name}=", val)
        end
    end
end