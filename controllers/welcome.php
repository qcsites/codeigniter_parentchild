<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
            $this->load->helper('url');
		$this->load->view('welcome_message');
	}
        
        public function test_employees() {
        $this->load->helper('url');
        $this->load->library('parentchild');
        
        $obj_parentchild = new $this->parentchild;
        // set the database table with the parent child related data
        $obj_parentchild->db_table="employees";	
        // set the child element field
	$obj_parentchild->item_identifier_field_name="EMPLOYEE_ID";
        // set the parent element field
	$obj_parentchild->parent_identifier_field_name="MANAGER_ID";
        // set the field list identifier field
	$obj_parentchild->item_list_field_name="LAST_NAME"; 
        $obj_parentchild->level_identifier="&nbsp;&nbsp;&nbsp;";
	$obj_parentchild->item_pointer="|-";
        $obj_parentchild->order_by_phrase = " ORDER BY LAST_NAME";
        
        $root_item_id = intval($this->uri->segment(3));
        // just setting a default value
        if ($root_item_id < 100 ) {
            $root_item_id = 100;
        }
        $all_childs = $obj_parentchild->getAllChilds(xss_clean($root_item_id));
        $html = "<p><b>All employees for employee id: ".$root_item_id."</b></p>";
        $html = $html . "<pre>";
	foreach($all_childs as $chld) {
		$html = $html .  $chld[$obj_parentchild->item_list_field_name]. ', ' . $chld['FIRST_NAME']. ' - ' . $chld['EMAIL']." ".anchor('welcome/test_employees/'.$chld['EMPLOYEE_ID'], "View from this level", 'title="Click to view this manager\'s employees."')." ".anchor('welcome/test_path/'.$chld['EMPLOYEE_ID'], "View full path for this employee", 'title="Click to view this employee full manager path."')."<br />";
	}
        $html = $html . "</pre>";
        $data['pc'] = $html;

        $this->load->view('vw_test_employee', $data);
    }
    
    public function test_pc() {
        $this->load->helper('url');
        $this->load->library('parentchild');
        
        $obj_parentchild = new $this->parentchild;
        // set the database table with the parent child related data
        $obj_parentchild->db_table="parentchild";	
        // set the child element field
	$obj_parentchild->item_identifier_field_name="ID";
        // set the parent element field
	$obj_parentchild->parent_identifier_field_name="Parent_ID";
        // set the field list identifier field
	$obj_parentchild->item_list_field_name="Name"; 
        $obj_parentchild->level_identifier="&nbsp;&nbsp;&nbsp;";
	$obj_parentchild->item_pointer="|-";
        $obj_parentchild->order_by_phrase = " ORDER BY Name";
        
        $root_item_id = intval($this->uri->segment(3));
        // just being used to default to value
        if ($root_item_id < 1 ) {
            $root_item_id = 1;
        }
        $all_childs = $obj_parentchild->getAllChilds(xss_clean($root_item_id));
        $html = "<p><b>All children for element: ".$root_item_id."</b></p>";
        $html = $html . "<pre>";
	foreach($all_childs as $chld) {
		$html = $html .  anchor('welcome/test_pc/'.$chld['ID'], $chld[$obj_parentchild->item_list_field_name], 'title="Click to view this element\'s children."')."<br />";
	}
        $html = $html . "</pre>";
        $data['pc'] = $html;

        $this->load->view('vw_test_pc', $data);
    }
    
    public function test_path() { 
        // get the full path for an employee 
        $this->load->helper('url');
        $this->load->library('parentchild');
        
        $obj_parentchild = new $this->parentchild;
        // set the database table with the parent child related data
        $obj_parentchild->db_table="employees";	
        // set the child element field
	$obj_parentchild->item_identifier_field_name="EMPLOYEE_ID";
        // set the parent element field
	$obj_parentchild->parent_identifier_field_name="MANAGER_ID";
        // set the field list identifier field
	$obj_parentchild->item_list_field_name="LAST_NAME"; 
        $obj_parentchild->level_identifier="  ";
	$obj_parentchild->item_pointer=">";
        $obj_parentchild->extra_condition = "";
        
        $item_id = $this->uri->segment(3);
        $html = "<p><b>The full path for element: ".$item_id."</b></p>";
	$item_path_array=$obj_parentchild->getItemPath(xss_clean($item_id), true); 
        $html = $html . "<pre>";
	foreach ($item_path_array as $val) { $html = $html . $val['LAST_NAME']."->"; }
        
        $data['path'] = $html;

        $this->load->view('vw_test_path', $data);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
