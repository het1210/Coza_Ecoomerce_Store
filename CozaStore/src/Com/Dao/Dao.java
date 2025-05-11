package Com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import net.bytebuddy.asm.Advice.ArgumentHandler.Factory;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;


import Com.Conn.ProjectConn;
import pojo.Banner;
import pojo.Cart;
import pojo.Category;
import pojo.Contact;
import pojo.Order;
import pojo.Product;
import pojo.Shipping;
import pojo.Subscribe;
import pojo.User;
import pojo.Wishlist;

public class Dao {

	static SessionFactory factory = new Configuration().configure().buildSessionFactory();

	// -------------------------------------------- contact ---------------------------------------------

	// add contact
	public void addContact(Contact c) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(c);
		tx.commit();
		session.close();
	}

	// view contact
	public List<Contact> viewcontact() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Contact.class);
		List<Contact> list = cri.list();
		return list;
	}

	// -------------------------------------------- Subscribe ------------------------------------------

	// add Subscribe
	public void addsubscribe(pojo.Subscribe s) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(s);
		tx.commit();
		session.close();
	}

	// view Subscribe
	public List<Subscribe> viewsubscribe() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Subscribe.class);
		List<Subscribe> list = cri.list();
		return list;
	}

	// -------------------------------------------- User -----------------------------------------------

	// add user
	public void addUser(User u) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(u);
		tr.commit();
		session.close();
	}

	// user id
	public User getUserById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("id", id));
		User u = (User) cr.uniqueResult();
		return u;
	}

	// delete users
	public void deleteUser(User u) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(u);
		tx.commit();
		session.close();
	}

	// User Name
	public User getUserByName(String name) {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("name", name));
		User u = (User) cr.uniqueResult();

		return u;
	}

	// View User
	public List<User> viewUsers() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(User.class);
		List<User> list = cr.list();
		return list;
	}
	
	//update user
	public void updateUser(User u) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(u);
		tx.commit();
		session.close();
	}

	// ----------------------------------------- category ---------------------------------------------------

	// add category
	public void savecategory(Category c) {
		Session se = factory.openSession();
		Transaction tr = se.beginTransaction();
		se.saveOrUpdate(c);
		tr.commit();
		se.close();
	}

	// view category
	public List<Category> viewCategory() {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		List<Category> list = cr.list();
		return list;
	}

	// get category by id
	public Category getCategoryById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		cr.add(Restrictions.eq("cid", id));
		Category c = (Category) cr.uniqueResult();

		return c;
	}

	// get category by name
	public Category getCategoryByName(String category) {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		cr.add(Restrictions.eq("category", category));
		Category c = (Category) cr.uniqueResult();

		return c;
	}

	// delete category
	public void deleteCategory(Category c) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(c);
		tx.commit();
		session.close();
	}
	
	// Update category
	public void updateCategory(Category c) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(c);
		tx.commit();
		session.close();
	}

	// get all category of given id
	public List<Product> viewcategoryById(int cid) {
		Session session = factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.cid =:id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
	
	//update category
	public static void EditCategor(Category c)
	{
		try {
			Connection conn=ProjectConn.createConnection();
			String sql="update category set category=?,cimage=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, c.getCategory());
			pst.setString(2, c.getCimage());
			pst.setInt(3, c.getCid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ----------------------------------------- Cart -------------------------------------------------------

	// add cart
	public void addCart(Cart c) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(c);
		tx.commit();
		session.close();
	}

	// view cart
	public List<Cart> viewCart() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Cart.class);
		List<Cart> list = cr.list();
		return list;
	}

	// cart by id
	public Cart getCartById(int id) {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Cart.class);
		cr.add(Restrictions.eq("id", id));
		Cart c = (Cart) cr.uniqueResult();

		return c;
	}

	// delete cart item
	public void deleteCart(Cart c) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(c);
		tx.commit();
	}

	// -----------------------------------------Product------------------------------------------------

	// view product
	public List<Product> viewProduct() {
		Session session = factory.openSession();
		Criteria cri = session.createCriteria(Product.class);
		List<Product> list = cri.list();
		return list;
	}

	// add product
	public void addProduct(Product p) {
		Session se = factory.openSession();
		Transaction tr = se.beginTransaction();
		se.save(p);
		tr.commit();
		se.close();
	}

	// product name
	public Product getProductByName(String productName) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Product.class);
		cr.add(Restrictions.eq("productName", productName));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	// get product by id
	public Product getProductById(int id) {
		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Product.class);
		cr.add(Restrictions.eq("id", id));
		Product p = (Product) cr.uniqueResult();
		return p;
	}

	// delete product
	public void deleteProduct(Product p) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(p);
		tx.commit();
		session.close();
	}

	// edit product
	public void editProduct(Product p) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(p);
		tx.commit();
		session.close();
	}
	
	//
	public static void EditProduct(Product p)
	{
		try {
			Connection conn=ProjectConn.createConnection();
			String sql="update product set productName=?,qty=?,price=?,description=?, image1=?,image2=?,image3=?,weight=?,dimensions=?,materials=?,size=?,color=? where id=? ";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,p.getProductName());
			pst.setInt(2,p.getQty());
			pst.setDouble(3,p.getPrice());
			pst.setString(4,p.getDescription());
			pst.setString(5,p.getImage1());
			pst.setString(6,p.getImage2());
			pst.setString(7,p.getImage3());
			pst.setDouble(8,p.getWeight());
			pst.setString(9,p.getDescription());
			pst.setInt(10,p.getMaterials());
			pst.setString(11,p.getSize());
			pst.setString(12,p.getColor());
			//pst.setNString(13,p.getCategory());
			
			pst.setInt(13, p.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// -----------------------------------------Shipping-----------------------------------------------

	// save Shipping
	public void saveShipping(Shipping s) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(s);
		tx.commit();
		session.close();
	}

	// view Shipping
	public List<Shipping> viewShipping() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Shipping.class);
		List<Shipping> list = cr.list();
		return list;
	}

	// -----------------------------------------Order--------------------------------------------------

	// save order
	public void saveOrder(Order o) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(o);
		tx.commit();
		session.close();
	}

	// view order
	public List<Order> viewOrder() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Order.class);
		List<Order> list = cr.list();
		return list;
	}

	public Order getOrderById(int orderId) {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Order.class);
		cr.add(Restrictions.eq("orderId", orderId));
		Order c = (Order) cr.uniqueResult();

		return c;
	}

	// --------------------------------------- Wishlist -----------------------------------------------

	// add wishlist
	public void addWishlist(Wishlist c) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		session.saveOrUpdate(c);
		tr.commit();
		session.close();
	}

	// view wishlist
	public List<Wishlist> viewWishlist() {

		Session session = factory.openSession();
		Criteria cr = session.createCriteria(Wishlist.class);
		List<Wishlist> list = cr.list();
		return list;
	}
	
	// Method to search a product by a keyword.
    /*public List<Product> searchProduct(String keyword) {
        String query = "SELECT * FROM product WHERE productName like '%" + keyword + "%' AND product_is_deleted = false";
        return searchProduct(query);
    }*/

	public  List<Product> searchProduct(String keyword) {
		String query = "SELECT * FROM product WHERE productName like '%" + keyword + "%' AND product_is_deleted = false";
        return searchProduct(query);
    }
	
	// -----------------------------------------Banner-----------------------------------------------

	// add category
		public static void saveimage(Banner b) {
			Session se = factory.openSession();
			Transaction tr = se.beginTransaction();
			se.saveOrUpdate(b);
			tr.commit();
			se.close();
		}
		

		// view category
		public List<Banner> viewimage() {
			Session session = factory.openSession();
			Criteria cr = session.createCriteria(Banner.class);
			List<Banner> list = cr.list();
			return list;
		}
		

		// get banner by id
		public Banner getBannerById(int id) {
			Session session = factory.openSession();
			Criteria cr = session.createCriteria(Banner.class);
			cr.add(Restrictions.eq("id", id));
			Banner c = (Banner) cr.uniqueResult();

			return c;
		}
		
		//
		public static void EditBanner(Banner b)
		{
			try {
				Connection conn=ProjectConn.createConnection();
				String sql="update banner set name=?,bimage=? where id=? ";
				PreparedStatement pst=conn.prepareStatement(sql);
				pst.setString(1, b.getName());
				pst.setString(2, b.getBimage());
				pst.setInt(3, b.getId());
				pst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public  void deleteBanner(int id)
		{
			Session session = factory.openSession();
			Transaction tr=session.beginTransaction();
			Banner b=session.get(Banner.class, id);
			session.delete(b);
			tr.commit();
			session.close();
		}
	


	
}
