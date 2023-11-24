export class Openings {
  id: number = 0;
  name: string = '';
  photo: string = '';
  description: string = '';
  wage: number = 0;
  constructor(
    id: number,
    name: string,
    photo: string,
    description: string,
    wage: number
  ) {
    this.id = id;
    this.name = name;
    this.photo = photo;
    this.description = description;
    this.wage = wage;
  }
}
