function TasksCtrl($scope, filterFilter) {
  $scope.alarms = [
      {"title":"Alarm1","rule1":"0","rule2":"1","rule3":"0", "triggered":false},
      {"title":"Alarm2","rule1":"1","rule2":"0","rule3":"0","triggered":false},
      {"title":"Alarm3","rule1":"0","rule2":"1","rule3":"0","triggered":false},
      {"title":"Alarm4","rule1":"0","rule2":"0.5","rule3":"0.5","triggered":false},
      {"title":"Alarm5","rule1":"0.5","rule2":"1","rule3":"0.5","triggered":false},
      {"title":"Alarm6","rule1":"0","rule2":"1","rule3":"0","triggered":false}
    ]; 
 $scope.rules = [
        {"title":"rule1", "done":false},
        {"title":"rule2", "done":false},
        {"title":"rule3", "done":false},
 ];
$scope.alarmsrules = [];
$scope.addRule=function (){
// ($window.mockWindow || $window).alert('Hello ');
//  alert($scope.selected.split('/')[0]);
  var nb_checked_rules = filterFilter($scope.rules, {done:true}).length;
  $scope.weight = [];
  $scope.rules.forEach( function(rule){
    if (rule.done)
      $scope.weight.push({"title":rule.title, "weight":1/nb_checked_rules})
    else
      $scope.weight.push({"title":rule.title, "weight":0});
    
  } )
  $scope.alarmsrules.push({
                       "rule1":$scope.weight[0].weight,"rule2":$scope.weight[1].weight,
                       "rule3":$scope.weight[2].weight})

 $scope.triggerAlarm=function (){ 
   $scope.alarmsrules.forEach(function(alarmrule){
    $scope.alarms.forEach (function(alarm){
      if(alarmrule.rule1==1 || alarmrule.rule2==1 || alarmrule.rule3==1){
          alarm.triggered = true;
          alarmrule.rule1 = 0;
          alarmrule.rule2 = 0;
          alarmrule.rule3 = 0; 
          console.log ("rule1: "+alarmrule.rule1)
          console.log ("rule2: "+alarmrule.rule2)
          console.log ("rule3: "+alarmrule.rule3)
        }
   console.log ( "triggered alarms "+alarm.title+":::"+alarm.triggered)
   })})
 }

 $scope.resetAlarm=function(){
   $scope.alarmsrules=[]; 
 }
}
};
