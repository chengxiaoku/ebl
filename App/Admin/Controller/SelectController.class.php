<?php
/**
 * Created by PhpStorm.
 * User: 程龙飞
 * Date: 2017/8/29
 * Time: 19:41
 */
namespace Admin\Controller;
class SelectController extends BaseController {
    function index(){
        extract(I('get.'));
        if(IS_GET){
            $this->assign('user_id',$user_id);
            //商品列表
            $type_data = M('type')->select();
            $style = M('style');
            $goods = M('goods');

            $order_data = M('order')->where(array('member_id'=>$user_id))->select();
            if(!is_null($order_data)){
                foreach ($order_data as $key => $val){
                    $new_order_data[$val['goods_id']] = $val;
                }
            }

            $str = '';
            if($type_data){
                foreach ($type_data as $key => $val) {
                    if($val['type'] == 1){
                        $str .='<div data-am-widget="titlebar" class="am-titlebar am-titlebar-multi">
                                <h2 class="am-titlebar-title ">
                                    '.$val['name'].'
                                </h2>

                                <nav class="am-titlebar-nav">
                                    <a href="#more" class="">more &raquo;</a>
                                </nav>
                            </div><section data-am-widget="accordion" class="am-accordion am-accordion-basic" data-am-accordion=\'{  }\'>';
                        //读取分类
                        $data = $style->where(array('type_id' => $val['id']))->select();
                        if($data){
                            foreach ($data as $_key => $_val){
                                $str .= ' <dl class="am-accordion-item">
                                    <dt class="am-accordion-title">'.$_val['name'].'</dt><dd class="am-accordion-bd am-collapse">
                                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                                        <div class="am-accordion-content">
                                            <table class="am-table am-table-bordered am-table-striped am-table-hover">
                                                <thead>
                                                <tr>
                                                    <th>名称</th>
                                                    <th>材质</th>
                                                    <th>颜色</th>
                                                    <th>数量</th>
                                                    <th>报价</th>
                                                    <th>尺寸</th>
                                                </tr>
                                                </thead>
                                                <tbody>';
                                $_data = $goods->where(array('style_id'=>$_val['id']))->select();
                                if($_data){
                                    foreach ($_data as $key1 => $val1){
                                        if(is_null($new_order_data[$val1['id']])){
                                            $str .= '<tr class="">
                                                    <td>'.$val1['name'].'</td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入材质" name="'.$val1['id'].'[1]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入颜色" name="'.$val1['id'].'[2]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入数量" name="'.$val1['id'].'[3]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入报价" name="'.$val1['id'].'[4]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入尺寸" name="'.$val1['id'].'[5]"></td>
                                                </tr>';
                                        }else{
                                            $str .= '<tr class="">
                                                    <td>'.$val1['name'].'</td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入材质" name="'.$val1['id'].'[1]" value="'.$new_order_data[$val1['id']]['goods_cz'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入颜色" name="'.$val1['id'].'[2]" value="'.$new_order_data[$val1['id']]['goods_color'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入数量" name="'.$val1['id'].'[3]" value="'.$new_order_data[$val1['id']]['goods_num'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入报价" name="'.$val1['id'].'[4]" value="'.$new_order_data[$val1['id']]['goods_price'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入尺寸" name="'.$val1['id'].'[5]" value="'.$new_order_data[$val1['id']]['goods_cc'].'"></td>
                                                </tr>';
                                        }

                                    }
                                    $str .= '</tbody>
                                            </table>
                                        </div>
                                    </dd>
                                </dl>';
                                }else{
                                    $str .= ' </tbody>
                                            </table>
                                            </div>
                                            </dd>
                                        </dl>
                                        ';
                                }
                            }
                        }
                        $str .= ' 
                            </section>';
                    }else{
                        $str .='<div data-am-widget="titlebar" class="am-titlebar am-titlebar-multi">
                                <h2 class="am-titlebar-title ">
                                    '.$val['name'].'
                                </h2>

                                <nav class="am-titlebar-nav">
                                    <a href="#more" class="">more &raquo;</a>
                                </nav>
                            </div><section data-am-widget="accordion" class="am-accordion am-accordion-basic" data-am-accordion=\'{  }\'>';
                        //读取分类
                        $data = $style->where(array('type_id' => $val['id']))->select();
                        if($data){
                            foreach ($data as $_key => $_val){
                                $str .= ' <dl class="am-accordion-item">
                                    <dt class="am-accordion-title">'.$_val['name'].'</dt><dd class="am-accordion-bd am-collapse">
                                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                                        <div class="am-accordion-content">
                                            <table class="am-table am-table-bordered am-table-striped am-table-hover">
                                                <thead>
                                                <tr>
                                                    <th>名称</th>
                                                    <th>材质</th>
                                                    <th>颜色</th>
                                                    <th>数量</th>
                                                    <th>报价</th>
                                                 
                                                </tr>
                                                </thead>
                                                <tbody>';
                                $_data = $goods->where(array('style_id'=>$_val['id']))->select();
                                if($_data){

                                    foreach ($_data as $key1 => $val1){
                                        if(is_null($new_order_data[$val1['id']])){
                                            $str .= '<tr class="">
                                                    <td>'.$val1['name'].'</td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入材质" name="'.$val1['id'].'[1]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入颜色" name="'.$val1['id'].'[2]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入数量" name="'.$val1['id'].'[3]"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入报价" name="'.$val1['id'].'[4]"></td>
                                          
                                                </tr>';
                                        }else{
                                            $str .= '<tr class="">
                                                    <td>'.$val1['name'].'</td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入材质" name="'.$val1['id'].'[1]" value="'.$new_order_data[$val1['id']]['goods_cz'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入颜色" name="'.$val1['id'].'[2]" value="'.$new_order_data[$val1['id']]['goods_color'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入数量" name="'.$val1['id'].'[3]" value="'.$new_order_data[$val1['id']]['goods_num'].'"></td>
                                                    <td><input type="text" class="input_wid" placeholder="请输入报价" name="'.$val1['id'].'[4]" value="'.$new_order_data[$val1['id']]['goods_price'].'"></td>
                                               
                                                </tr>';
                                        }

                                    }
                                    $str .= '</tbody>
                                            </table>
                                        </div>
                                    </dd>
                                </dl>';
                                }else{
                                    $str .= ' </tbody>
                                            </table>
                                            </div>
                                            </dd>
                                        </dl>
                                        ';
                                }
                            }
                        }
                        $str .= ' 
                            </section>';
                    }

                }
            }
            $this->assign('str',$str);
            $this->display();
        }
    }

    /**
     * 添加
     */
    function add(){

        $arr_data = I('post.');
        $userid = $arr_data['user_id'];
        $order = M('order');
        foreach ($arr_data as $key => $val){
            if(is_numeric($key)){
                $_data = $order->where(array('member_id'=>$userid,'goods_id'=>$key))->find();
                if(!$_data){
                    $add_data[] = array('member_id' => $userid,'goods_id' => $key,'goods_cz' => $val[1],'goods_color' => $val[2],'goods_num'=>$val[3],'goods_price'=>$val[4],'goods_cc'=>$val[5]);
                }else{
                    $_data['goods_cz'] = $val[1];
                    $_data['goods_color'] = $val[2];
                    $_data['goods_num'] = $val[3];
                    $_data['goods_price'] = $val[4];
                    $_data['goods_cc'] = $val[5];
                    $order->save($_data);
                }
            }
        }
        $bool = M('order')->addAll($add_data);
        echo '<h4>保存成功!请点击右上角关闭按钮 关闭模态框</h4>';

    }
}