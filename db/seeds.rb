# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['GÀ KHO SẢ',
'GÀ HẢI NAM',
'PHI LÊ GÀ XÀO CAY',
'SƯỜN MIẾNG SỐT MÈ',
'SƯỜN NON RAM MẶN',
'THỊT HEO LUỘC ( cà pháo mắm tôm )',
'THỊT KHO TRỨNG VỊT ( kho tàu )',
'THỊT BA CHỈ MUỐI CHIÊN',
'THỊT BA CHỈ KHO MẮM RUỐC',
'THỊT BA CHỈ KHO CÀ DĨA',
'THỊT NẠC KHO TIÊU',
'ĐẬU HỦ MUỐI XẢ CHIÊN',
'ĐẬU HỦ DỒN THỊT SỐT CÀ',
'MẮM CHƯNG THỊT HEO',
'TRỨNG BẮC THẢO & TRỨNG MUỐI CHƯNG',
'TRỨNG CHIÊN THỊT HEO',
'PHÁ LẤU HEO (TAI-MŨI-LƯỠI)',
'PHI LÊ CÁ BASA TẨM BỘT CHIÊN (sốt mainyounasie)',
'CÁ TRÊ CHIÊN ( mắm gừng )',
'ẾCH XÀO SẢ NGHỆ',
'CHẢ CÁ KHO NẤM RƠM',
'CHẢ CÁ KHO THƠM',
'CÁ LÓC KHO TIÊU',
'CÁ KÈO KHO TIÊU',
'CÁ ĐIÊU HỒNG SỐT CHANH DÂY',
'CÁ ĐIÊU HỒNG KHO TIÊU',
'CÁ SAPA SỐT CÀ',
'CÁ HÚ KHO THƠM',
'CÁ NỤC KHO CÀ',
'CANH CHUA CÁ ( LÓC,HÚ,ĐIÊU HỒNG & KHÔNG CÁ )',
'CANH KHỔ QUA DỒN CHẢ CÁ',
'CANH CUA NẤU RAU ĐAY',
'CANH SƯỜN HEO HẦM ĐU ĐỦ',
'CANH SƯỜN HEO HẦM CỦ CẢI TRẮNG',
'CANH MƯỚP KHÍA NẤU TRỨNG',
'CANH CHẢ CÁ NẤU CẢI XANH',
'THỊT HEO XÀO BÔNG CẢI',
'THỊT BÒ XÀO BÔNG HẸ',
'THỊT HEO XÀO ĐẬU CÔ QUE',
'KHỔ QUA XÀO TRỨNG'].each do |name|
  Food.find_or_create_by_name_and_price(name, 21000)
end
