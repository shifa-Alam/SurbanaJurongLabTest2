import { Component, OnInit } from '@angular/core';
import { Member } from '../Models/member';
import { MemberService } from '../services/member.service';

@Component({
  selector: 'app-member-landing',
  templateUrl: './member-landing.component.html',
  styleUrls: ['./member-landing.component.css']
})
export class MemberLandingComponent implements OnInit {
members:Member[]=[];
  constructor(private service: MemberService) {

  }
  ngOnInit(): void {
    this.getMembers();
  }
  getMembers() {
    // this.isLoading = true;
    this.service.getMember().subscribe(result => {
    this.members=result;
      // this.dataSource = new MatTableDataSource(result.subset);
      // this.isLoading = false;
    },
      error => {
      
        // this.isLoading = false;
      }
    );
  }

}
