import { Component, ElementRef, Input } from '@angular/core';
import { ApiService } from '../api.service';
import { EventInfo } from '../eventinfo';

@Component({
  selector: 'app-view-event',
  templateUrl: './view-event.component.html',
  styleUrls: ['./view-event.component.css']
})
export class ViewEventComponent {

  EName?:string;
  EstartDate?:string;
  EendDate?:string;
  Eimage?:string;
  activityflag=false;
  eventInfos?: EventInfo[];
  eventInfo = new EventInfo();

  constructor(private apiService: ApiService){}

  ngOnInit(): void {
    this.eventInfo.Id = this.apiService.eventId;
    // call api for get Event info
    this.apiService.addPerson(this.eventInfo,"api/AllEventsinfo")
      .subscribe(
        data => {
          this.EName=data.ArrayOfResponse[0].EventName;
          this.EstartDate=data.ArrayOfResponse[0].EventStartDate;
          this.EendDate=data.ArrayOfResponse[0].EventEndDate;
          this.Eimage=data.ArrayOfResponse[0].EventImage;
          this.eventInfos=data.ArrayOfResponse;
          if(data.ArrayOfResponse[0].EventActivityName==null){
            this.activityflag=true;
          }
          console.log(this.eventInfos)
        }, 
        error => {
          alert("Error")
          console.log(error);
    });
  }
}
