require 'test_helper'

class Admin::TotemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_totem = admin_totems(:one)
  end

  test "should get index" do
    get admin_totems_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_totem_url
    assert_response :success
  end

  test "should create admin_totem" do
    assert_difference('Admin::Totem.count') do
      post admin_totems_url, params: { admin_totem: { circuit_id: @admin_totem.circuit_id, created_at: @admin_totem.created_at, description: @admin_totem.description, infographic_content_type: @admin_totem.infographic_content_type, infographic_file_name: @admin_totem.infographic_file_name, infographic_file_size: @admin_totem.infographic_file_size, infographic_updated_at: @admin_totem.infographic_updated_at, latitude: @admin_totem.latitude, location: @admin_totem.location, longitude: @admin_totem.longitude, name: @admin_totem.name, slug: @admin_totem.slug, updated_at: @admin_totem.updated_at } }
    end

    assert_redirected_to admin_totem_url(Admin::Totem.last)
  end

  test "should show admin_totem" do
    get admin_totem_url(@admin_totem)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_totem_url(@admin_totem)
    assert_response :success
  end

  test "should update admin_totem" do
    patch admin_totem_url(@admin_totem), params: { admin_totem: { circuit_id: @admin_totem.circuit_id, created_at: @admin_totem.created_at, description: @admin_totem.description, infographic_content_type: @admin_totem.infographic_content_type, infographic_file_name: @admin_totem.infographic_file_name, infographic_file_size: @admin_totem.infographic_file_size, infographic_updated_at: @admin_totem.infographic_updated_at, latitude: @admin_totem.latitude, location: @admin_totem.location, longitude: @admin_totem.longitude, name: @admin_totem.name, slug: @admin_totem.slug, updated_at: @admin_totem.updated_at } }
    assert_redirected_to admin_totem_url(@admin_totem)
  end

  test "should destroy admin_totem" do
    assert_difference('Admin::Totem.count', -1) do
      delete admin_totem_url(@admin_totem)
    end

    assert_redirected_to admin_totems_url
  end
end
