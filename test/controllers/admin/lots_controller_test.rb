require 'test_helper'

class Admin::LotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_lot = admin_lots(:one)
  end

  test "should get index" do
    get admin_lots_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_lot_url
    assert_response :success
  end

  test "should create admin_lot" do
    assert_difference('Admin::Lot.count') do
      post admin_lots_url, params: { admin_lot: { body_style: @admin_lot.body_style, buy_now_price: @admin_lot.buy_now_price, city: @admin_lot.city, color: @admin_lot.color, cop_created_date: @admin_lot.cop_created_date, country: @admin_lot.country, currency_code: @admin_lot.currency_code, cylinders: @admin_lot.cylinders, damage_description: @admin_lot.damage_description, drive: @admin_lot.drive, engine: @admin_lot.engine, est_retail_value: @admin_lot.est_retail_value, fuel_type: @admin_lot.fuel_type, grid_rows: @admin_lot.grid_rows, has_keys: @admin_lot.has_keys, high_bid: @admin_lot.high_bid, item_no: @admin_lot.item_no, lot_cond_code: @admin_lot.lot_cond_code, lot_number: @admin_lot.lot_number, make: @admin_lot.make, model_detail: @admin_lot.model_detail, model_group: @admin_lot.model_group, odometer: @admin_lot.odometer, odometer_brand: @admin_lot.odometer_brand, offer_eligible: @admin_lot.offer_eligible, runs_drives: @admin_lot.runs_drives, sale_date: @admin_lot.sale_date, sale_status: @admin_lot.sale_status, sale_time: @admin_lot.sale_time, sale_title_state: @admin_lot.sale_title_state, sale_title_type: @admin_lot.sale_title_type, secondary_damage: @admin_lot.secondary_damage, special_note: @admin_lot.special_note, state: @admin_lot.state, thumbnail: @admin_lot.thumbnail, transmission: @admin_lot.transmission, vehicle_type: @admin_lot.vehicle_type, vin: @admin_lot.vin, yard_name: @admin_lot.yard_name, yard_number: @admin_lot.yard_number, year: @admin_lot.year, zip: @admin_lot.zip } }
    end

    assert_redirected_to admin_lot_url(Admin::Lot.last)
  end

  test "should show admin_lot" do
    get admin_lot_url(@admin_lot)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_lot_url(@admin_lot)
    assert_response :success
  end

  test "should update admin_lot" do
    patch admin_lot_url(@admin_lot), params: { admin_lot: { body_style: @admin_lot.body_style, buy_now_price: @admin_lot.buy_now_price, city: @admin_lot.city, color: @admin_lot.color, cop_created_date: @admin_lot.cop_created_date, country: @admin_lot.country, currency_code: @admin_lot.currency_code, cylinders: @admin_lot.cylinders, damage_description: @admin_lot.damage_description, drive: @admin_lot.drive, engine: @admin_lot.engine, est_retail_value: @admin_lot.est_retail_value, fuel_type: @admin_lot.fuel_type, grid_rows: @admin_lot.grid_rows, has_keys: @admin_lot.has_keys, high_bid: @admin_lot.high_bid, item_no: @admin_lot.item_no, lot_cond_code: @admin_lot.lot_cond_code, lot_number: @admin_lot.lot_number, make: @admin_lot.make, model_detail: @admin_lot.model_detail, model_group: @admin_lot.model_group, odometer: @admin_lot.odometer, odometer_brand: @admin_lot.odometer_brand, offer_eligible: @admin_lot.offer_eligible, runs_drives: @admin_lot.runs_drives, sale_date: @admin_lot.sale_date, sale_status: @admin_lot.sale_status, sale_time: @admin_lot.sale_time, sale_title_state: @admin_lot.sale_title_state, sale_title_type: @admin_lot.sale_title_type, secondary_damage: @admin_lot.secondary_damage, special_note: @admin_lot.special_note, state: @admin_lot.state, thumbnail: @admin_lot.thumbnail, transmission: @admin_lot.transmission, vehicle_type: @admin_lot.vehicle_type, vin: @admin_lot.vin, yard_name: @admin_lot.yard_name, yard_number: @admin_lot.yard_number, year: @admin_lot.year, zip: @admin_lot.zip } }
    assert_redirected_to admin_lot_url(@admin_lot)
  end

  test "should destroy admin_lot" do
    assert_difference('Admin::Lot.count', -1) do
      delete admin_lot_url(@admin_lot)
    end

    assert_redirected_to admin_lots_url
  end
end
