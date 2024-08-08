import { Injectable } from '@angular/core';

export type AdminUser = {
  id: string
  username: string
  created_at: string
}

@Injectable({
  providedIn: 'root'
})
export class BusinessService {
  AdminList: AdminUser[] = [
    {
      id: '1',
      username: 'root',
      created_at: '2021-01-01'
    },
    {
      id: '2',
      username: 'admin',
      created_at: '2021-01-01'
    },
    {
      id: '3',
      username: 'admin2',
      created_at: '2021-01-01'
    }
  ]

  constructor() { }

  getAdminList() {
    return this.AdminList
  }

  addAdmin(user: AdminUser) {
    this.AdminList.push(user)
  }

  deleteAdmin(id: string) {
    this.AdminList = this.AdminList.filter(user => user.id !== id)
  }

  updateAdmin(user: AdminUser) {
    this.AdminList = this.AdminList.map(u => {
      if (u.id === user.id) {
        return user
      }
      return u
    })
  }
}
