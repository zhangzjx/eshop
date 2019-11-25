package com.zhang.utils;

/**
 * @author prayers
 * @date 2019/11/4 10:17
 */
public class Lsh {
    /**
     * 生成规则编号:前缀+五位编号（从1开始，不够前补0）
     *
     * @param equipmentType
     *              前缀
     * @param equipmentNo
     *              最新设备编号
     * @return
     */
    public static String getNewEquipmentNo(String equipmentType, String equipmentNo){
        String newEquipmentNo = "00001";
        if(equipmentNo != null && !equipmentNo.isEmpty()){
            int newEquipment = Integer.parseInt(equipmentNo) + 1;
            newEquipmentNo = String.format(equipmentType + "%05d", newEquipment);
        }
        return newEquipmentNo;
    }

/***
    public static void main(String[] args) {
        String equipmentNo = Lsh.getNewEquipmentNo("1000", "00032");
        System.out.println("生成流水号：" + equipmentNo);
    }
 */


}
