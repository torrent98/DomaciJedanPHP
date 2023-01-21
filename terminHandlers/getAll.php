<?php

require "../model/Termin.php";
require '../Broker.php';

$broker=Broker::getBroker();

    $resultSet = Termin::getAll($broker);
    $response=[];

    if(!$resultSet){
    $response['status']=0;
    $response['greska']=$broker->getMysqli()->error;
    } 
    else{
    $response['status']=1;
    while($row=$resultSet->fetch_object()){
        $response['termini'][]=$row;
    }
}
    echo json_encode($response);

?>