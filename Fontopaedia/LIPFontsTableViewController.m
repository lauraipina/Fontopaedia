//
//  LIPFontsTableViewController.m
//  Fontopaedia
//
//  Created by Laura Iglesias Piña on 28/1/15.
//  Copyright (c) 2015 lip. All rights reserved.
//

#import "LIPFontsTableViewController.h"
#import "LIPFontViewController.h"

@interface LIPFontsTableViewController ()
//Está guardado aqui para que no se manipule, ya que, solo cogemos las fuentes del dispositivo
@property (strong, nonatomic) NSArray *familyNames;

@end



@implementation LIPFontsTableViewController

//Sobreescribimos el inicializador designado
-(id) initWithStyle:(UITableViewStyle)style{
    
    if (self == [super initWithStyle:style]) {
        
        //rellenamos con las familias y las ordenamos
        _familyNames = [[UIFont familyNames] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        self.title = @"Fontopaedia";
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    //Numero de familias serán el número de secciones
    return [[self familyNames] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //Como titulo de sección, mostramos el nombre de la familia
    return [[self familyNames] objectAtIndex:section];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //El número de filas por sección serán las fuentes de cada familia
    return [[UIFont fontNamesForFamilyName:[[self familyNames] objectAtIndex:section]] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    //Metodo que nos pregunta la tabla para mostrar los índices
    return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",
             @"Ñ",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Si no hay celdas disponibles
    if (cell == nil) {
        
        //creamos una nueva
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    //Volcamos los valores a la celda
    NSString *fontName = [[UIFont fontNamesForFamilyName:[self.familyNames objectAtIndex:indexPath.section] ] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName
                                          size:30.0];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *fontName = [[UIFont fontNamesForFamilyName:[self.familyNames objectAtIndex:indexPath.section] ] objectAtIndex:indexPath.row];
    
    UIFont *font = [UIFont fontWithName:fontName
                                   size:20.0];
    
    //Creamos el controlador que muestra una fuente individual y lo inicializo con la fuente seleccionada
    LIPFontViewController *fontVC = [[LIPFontViewController alloc] initWithFont:font];
    
    //Hacemos un push para pasar a la vista detalle
    [self.navigationController pushViewController:fontVC
                                         animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
