require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
    
    test "invalid signup information" do
        get signup_path
        assert_no_difference 'User.count' do
            post users_path, params: { user: { name: "2",
                email: "user@invalid",
                sex: "",
                department_id: "2",
                password: "foo",
                phonenumber: "2",
                status: "d" } }
        end
        assert_template 'users'
    end
    
    test "valid signup information" do
        get signup_path
        assert_difference 'User.count', 1 do
            post users_path, params: { user: { name: "test",
                email: "test@test.com",
                
                department_id: "2",
                password: "fosssssssso",
                phonenumber: "22222222222",
                status: "d" } }
        end
        follow_redirect!
        assert_template 'users/show'
end
end